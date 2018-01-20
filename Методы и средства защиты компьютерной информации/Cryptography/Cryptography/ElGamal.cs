using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Numerics;

namespace Cryptography
{
    public class ElGamal
    {
        public ElGamal()
        {
        }

        public struct PublicKey
        {
            public int p;
            public int g;
            public int y;
        }

        public struct PrivateKey
        {
            public int x;
        }

        public struct Keys
        {
            public PublicKey PublicKey;
            public PrivateKey PrivateKey;
        }   
        
        private int GetSimpleNumber(int MinValue, int MaxValue)
        {
            if (MaxValue < MinValue)
            {
                return (1);
            }
            bool[] NumbersSequence = new bool[MaxValue];            
            for (int i = 0; i < MaxValue; i++)
            {
                NumbersSequence[i] = true;
            }
            for (int i = 2; Convert.ToInt32(Math.Pow(i, 2)) < MaxValue; i++)
            {
                if (NumbersSequence[i - 2] == true)
                {
                    for (int j = Convert.ToInt32(Math.Pow(i, 2)); j < MaxValue; j += i)
                    {
                        if (NumbersSequence[j - 2] == true)
                        {
                            NumbersSequence[j - 2] = false;
                        }
                    }
                }
            }
            List<int> SimpleNumbersList = new List<int>();
            for (int i = 0; i < MaxValue; i++)
            {
                if (NumbersSequence[i] == true)
                {
                    if ((i + 2) > MinValue)
                    {
                        SimpleNumbersList.Add(i + 2);
                    }
                }
            }
            if (SimpleNumbersList.Count == 0)
            {
                return (1);
            }
            Random Random = new Random();
            int SimpleNumber = SimpleNumbersList[Random.Next(SimpleNumbersList.Count)];
            SimpleNumbersList.Clear();
            return (SimpleNumber);
        }

        private int GetGCD(int First, int Second)
        {
            while (First != Second)
            {
                if (First > Second)
                {
                    First -= Second;
                }
                else
                {
                    Second -= First;
                }
            }
            return (First);
        }
        
        public Keys GenerateKeys()
        {
            Keys keys = new Keys();
            keys.PublicKey.p = GetSimpleNumber(1000, 10000);
            Random Random = new Random();
            keys.PublicKey.g = Random.Next(1, keys.PublicKey.p);
            keys.PrivateKey.x = Random.Next(2, keys.PublicKey.p - 1);
            BigInteger TempBigInteger = new BigInteger();
            TempBigInteger = BigInteger.Pow(keys.PublicKey.g, keys.PrivateKey.x);
            TempBigInteger %= keys.PublicKey.p;
            keys.PublicKey.y = Convert.ToInt32(TempBigInteger.ToString());
            return keys;
        }

        public string Encode(string Text, PublicKey PublicKey)
        {
            string EncodeText = "";
            if ((PublicKey.y != 0) && (PublicKey.g != 0) && (PublicKey.p != 0) && (Text != ""))
            {
                Random Random = new Random();
                int k;
                int a;
                int b;
                int CharCode;
                BigInteger TempBigInteger = new BigInteger(); 
               
                for (int i = 0; i < Text.Length; i++)
                {
                    do
                    {
                        k = Random.Next(2, PublicKey.p - 1);
                    } while (GetGCD(k, PublicKey.p) != 1);

                    TempBigInteger = BigInteger.Pow(PublicKey.g, k);
                    TempBigInteger %= PublicKey.p;
                    a = Convert.ToInt32(TempBigInteger.ToString());
                    CharCode = Convert.ToInt32(Text[i]);
                    TempBigInteger = BigInteger.Pow(PublicKey.y, k) * CharCode;
                    TempBigInteger %= PublicKey.p;
                    b = Convert.ToInt32(TempBigInteger.ToString());
                    EncodeText += Convert.ToChar(a);
                    EncodeText += Convert.ToChar(b);                        
                }
            }
            return (EncodeText);
        }

        public string Decode(string Text, Keys Keys)
        {
            string DecodeText = "";
            if ((Text != "") && (Keys.PrivateKey.x != 0) && (Keys.PublicKey.g != 0) && (Keys.PublicKey.p != 0) && (Keys.PublicKey.y != 0))
            {
                int a = 0;
                int b = 0;
                int CharCode;
                BigInteger TempBigInteger = new BigInteger();
                for (int i = 0; i < Text.Length; i += 2)
                {
                    a = Convert.ToInt32(Text[i]);
                    b = Convert.ToInt32(Text[i + 1]);
                    TempBigInteger = BigInteger.Pow(a, Keys.PublicKey.p - 1 - Keys.PrivateKey.x) * b;
                    TempBigInteger %= Keys.PublicKey.p;
                    CharCode = Convert.ToInt32(TempBigInteger.ToString());
                    DecodeText += Convert.ToChar(CharCode);
                }
            }
            return (DecodeText);
        }    
    }
}
