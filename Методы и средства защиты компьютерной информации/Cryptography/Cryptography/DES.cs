using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Security.Cryptography;
using System.IO;

namespace Cryptography
{
    public class DES
    {
        DESCryptoServiceProvider key = null;

        public DES()
        {
            key = new DESCryptoServiceProvider();
        }

        public byte[] Encode(string PlainText)
        {
            // Create a memory stream.
            MemoryStream ms = new MemoryStream();

            // Create a CryptoStream using the memory stream and the
            // CSP DES key.
            CryptoStream encStream = new CryptoStream(ms, key.CreateEncryptor(), CryptoStreamMode.Write);

            // Create a StreamWriter to write a string
            // to the stream.
            StreamWriter sw = new StreamWriter(encStream);

            // Write the plaintext to the stream.
            sw.WriteLine(PlainText);

            // Close the StreamWriter and CryptoStream.
            sw.Close();
            encStream.Close();

            // Get an array of bytes that represents
            // the memory stream.
            byte[] buffer = ms.ToArray();

            // Close the memory stream.
            ms.Close();

            // Return the encrypted byte array.
            return buffer;
        }

        public string Decode(byte[] CypherText)
        {
            // Create a memory stream to the passed buffer.
            MemoryStream ms = new MemoryStream(CypherText);

            // Create a CryptoStream using the memory stream and the
            // CSP DES key.
            CryptoStream encStream = new CryptoStream(ms, key.CreateDecryptor(), CryptoStreamMode.Read);

            // Create a StreamReader for reading the stream.
            StreamReader sr = new StreamReader(encStream);

            // Read the stream as a string.
            string val = sr.ReadLine();

            // Close the streams.
            sr.Close();
            encStream.Close();
            ms.Close();

            return val;
        }
    }
}
