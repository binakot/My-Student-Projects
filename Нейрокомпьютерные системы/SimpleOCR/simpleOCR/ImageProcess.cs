using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Drawing;

namespace simpleOCR
{
    public static class ImageProcess
    {
        public static Bitmap Binarization(Bitmap img, int factor)
        {
            for (int i = 0; i <= img.Height - 1; i++)
                for (int j = 0; j <= img.Width - 1; j++)
                {
                    Color clr = img.GetPixel(j, i);

                    if ((clr.R + clr.G + clr.B) / 3 > factor)
                        img.SetPixel(j, i, Color.White);
                    else
                        img.SetPixel(j, i, Color.Black);
                }

            return img;
        }

        public static Bitmap GetRegion(Bitmap img, Rectangle section)
        {
            Bitmap bmp = null;

            try
            {
                bmp = new Bitmap(section.Width, section.Height);
                using (Graphics g = Graphics.FromImage(bmp))
                {
                    g.DrawImage(img, 0, 0, section, GraphicsUnit.Pixel);
                }
            }
            catch
            { 

            }

            return bmp;
        }

        public static Bitmap SetSize(Bitmap source, int x, int y, int width, int height)
        {
            Bitmap result = null;

            try
            {
                result = new Bitmap(width, height);
                Graphics g = Graphics.FromImage(result);
                g.Clear(Color.White);
                g.DrawImage(source, x, y, width, height);
            }
            catch
            {

            }

            return result;
        }

        public static Rectangle GetBorder(Bitmap source)
        {
            int xLeft = -1, xRight = -1, yTop = -1, yBottom = -1;
            for (int j = 0; j < source.Width - 1; j++)
            {
                for (int i = 0; i < source.Height - 1; i++)
                    if (source.GetPixel(j, i).R != 255 && source.GetPixel(j, i).G != 255 && source.GetPixel(j, i).B != 255)
                    {
                        xLeft = j;
                        break;
                    }
                if (xLeft == j)
                    break;
            }
            for (int j = source.Width - 1; j > 0; j--)
            {
                for (int i = 0; i < source.Height - 1; i++)
                    if (source.GetPixel(j, i).R != 255 && source.GetPixel(j, i).G != 255 && source.GetPixel(j, i).B != 255)
                    {
                        xRight = j;
                        break;
                    }
                if (xRight == j)
                    break;
            }
            for (int i = 0; i < source.Height - 1; i++)
            {
                for (int j = 0; j < source.Width - 1; j++)
                    if (source.GetPixel(j, i).R != 255 && source.GetPixel(j, i).G != 255 && source.GetPixel(j, i).B != 255)
                    {
                        yTop = i;
                        break;
                    }
                if (yTop == i)
                    break;
            }
            for (int i = source.Height - 1; i > 0; i--)
            {
                for (int j = 0; j < source.Width - 1; j++)
                    if (source.GetPixel(j, i).R != 255 && source.GetPixel(j, i).G != 255 && source.GetPixel(j, i).B != 255)
                    {
                        yBottom = i;
                        break;
                    }
                if (yBottom == i)
                    break;
            }

            return new Rectangle(xLeft - 1, yTop - 1, xRight - xLeft + 3, yBottom - yTop + 3);
        }
    }
}
