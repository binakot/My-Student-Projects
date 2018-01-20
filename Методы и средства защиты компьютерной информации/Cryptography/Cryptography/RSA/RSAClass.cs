using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace Cryptography
{
    class RSAClass
    {
        public byte p;
        public byte q;
        public ushort phi;
        public ushort n;
        public ushort e;
        public ushort d;

        private struct ExtendedEuclideanResult
        {
            public int u1;
            public int u2;
            public int gcd;
        }

        public RSAClass()
        {
            //InitKeyData();
        }
       
        private void InitKeyData()
        {
            Random random = new Random();

            byte[] simple = GetNotDivideable();
            this.p = simple[random.Next(0, simple.Length)];
            this.q = simple[random.Next(0, simple.Length)];
            this.n = (ushort)(this.p * this.q);
            this.phi = (ushort)((p - 1) * (q - 1));
            List<ushort> possibleE = GetAllPossibleE(this.phi);

            do
            {
                this.e = possibleE[random.Next(0, possibleE.Count)];
                this.d = (ushort)ExtendedEuclide(this.e % this.phi, this.phi).u1;
            } while (this.d < 0);
        }        

        public Int32 GetNKey()
        {
            return this.n;
        }

        public Int32 GetDKey()
        {
            return this.d;
        }

        public string encode(string text, out int TS)
        {
            InitKeyData();

            string outStr = "";
            TS = 0;            
            byte[] strBytes = Encoding.Default.GetBytes(text);
            foreach (byte value in strBytes)
            {
                int encryptedValue = ModuloPow(value, this.e, this.n);
                outStr += encryptedValue + "|";
                TS += encryptedValue;
            }

            return outStr;
        }

        public string decode(string text, string n_s, string d_s, out int TS)
        {
            string outStr = "";            
            Int32 n = Int32.Parse(n_s);
            Int32 d = Int32.Parse(d_s);
            Int32[] arr = GetDecArrayFromText(text, out TS);
            byte[] bytes = new byte[arr.Length];            
            int j=0;
            foreach (int i in arr)
            {
                byte decryptedValue = (byte)ModuloPow(i, d, n);

                bytes[j] = decryptedValue;
                j++;
                
            }
            outStr += Encoding.Default.GetString(bytes);
            return outStr;
        }

        private Int32[] GetDecArrayFromText(string text, out int TS)
        {
            int i = 0;
            foreach (char c in text)
            {
                if (c == '|')
                {
                    i++;
                }
            }

            Int32[] result = new Int32[i];
            TS = 0;
            i = 0;

            string tmp = "";

            foreach (char c in text)
            {
                if (c != '|')
                {
                    tmp += c;
                }
                else
                {
                    result[i] = Int32.Parse(tmp);
                    TS += result[i];
                    i++;
                    tmp = "";
                }
            }

            return result;
        }

        static int ModuloPow(int value, int pow, int modulo)
        {
            int result = value;
            for (int i = 0; i < pow - 1; i++)
            {
                result = (result * value) % modulo;
            }
            return result;
        }

        /// Получить все варианты для e
        static List<ushort> GetAllPossibleE(ushort phi)
        {
            List<ushort> result = new List<ushort>();

            for (ushort i = 2; i < phi; i++)
            {
                if (ExtendedEuclide(i, phi).gcd == 1)
                {
                    result.Add(i);
                }
            }

            return result;
        }

        /// <summary>
        /// u1 * a + u2 * b = u3
        /// </summary>
        /// <param name="a">Число a</param>
        /// <param name="b">Модуль числа</param>
        private static ExtendedEuclideanResult ExtendedEuclide(int a, int b)
        {
            int u1 = 1;
            int u3 = a;
            int v1 = 0;
            int v3 = b;

            while (v3 > 0)
            {
                int q0 = u3 / v3;
                int q1 = u3 % v3;

                int tmp = v1 * q0;
                int tn = u1 - tmp;
                u1 = v1;
                v1 = tn;

                u3 = v3;
                v3 = q1;
            }

            int tmp2 = u1 * (a);
            tmp2 = u3 - (tmp2);
            int res = tmp2 / (b);

            ExtendedEuclideanResult result = new ExtendedEuclideanResult()
            {
                u1 = u1,
                u2 = res,
                gcd = u3
            };

            return result;
        }

        static private byte[] GetNotDivideable()
        {
            List<byte> notDivideable = new List<byte>();

            for (int x = 2; x < 256; x++)
            {
                int n = 0;
                for (int y = 1; y <= x; y++)
                {
                    if (x % y == 0)
                        n++;
                }

                if (n <= 2)
                    notDivideable.Add((byte)x);
            }
            return notDivideable.ToArray();
        }
    }
}
