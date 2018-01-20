using System;
using System.Collections.Generic;
using System.Text;

namespace Optimization_Methods
{
    public class FunctionClass
    { 
        // Функция одной переменной
        public static double Function1(double x)
        {
            return Math.Exp(x * Math.Log(5, Math.E)) - 6 * x - 3;                    
        }

        // Функция двух переменных
        public static double Function2(double x, double y)
        {
            //return x * x + y * y;       

            //return Math.Exp(-Math.Abs(x)) + Math.Exp(-Math.Abs(y));

            return Math.Cosh(x) + Math.Cosh(y);

            //return Math.Pow(Math.Sin(x) + x, 2) + Math.Pow(Math.Sin(y) + y, 2);
            //return Math.Abs(Math.Sin(x) + x) + Math.Abs(Math.Sin(y) + y);
            //return 3 * x * x - x + 2 + y * y;
     
            //return Math.Sin(x) + Math.Cos(y);
            //return Math.Sqrt((x - 100) * (x - 100) + (y - 100) * (y - 100));  // Конус
            //return Math.Sin(x) * Math.Cos(y);
            //return 3 * x * x - 3 * x * y + 4 * y * y - 2 * x + y + 0;
            //return Math.Sin(0.5 * x * x - 0.25 * y * y + 3) * Math.Cos(2 * x + 1 - Math.Exp(y));
            //return 11 * x - 0.4 * y + Math.Exp(x * x + 0.21 * y * y);
            //return 9 * x * x - 15 * x + 2 - 2 * Math.Sin(3.5 * x) * y + y * y + 2 * Math.Sin(y) + 15;    
        
            //return Math.Pow(x * x + y - 11, 2) + Math.Pow(x + y * y - 7, 2);
            // x^4 - 21x^2 - 14x + y^4 - 13y^2 - 22y + 2x^2y + 2xy^2 + 170
        }

        public static double Function3(double[] x)
        {
            //return x[0] * x[0] + x[1] * x[1];

            return Math.Pow(x[0] * x[0] + x[1] - 11, 2) + Math.Pow(x[0] + x[1] * x[1] - 7, 2);
        }
    }
}
