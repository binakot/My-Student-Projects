using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Text;
using System.Windows.Forms;

namespace Cryptography
{
    public partial class MainForm : Form
    {
        private const string inputPath = @"input.txt";
        private const string encodePath = @"encode.txt";
        private const string decodePath = @"decode.txt";

        private string log = string.Empty;

        private static CharactersClass characters = new CharactersClass(); // Класс дял работы с символами
        private Transposition transpositionMetod = new Transposition();  // Метод перестановок   
        private Vigenere vigereMethod = new Vigenere(CharactersClass.alphabet);  // Алгоритм Виженера матричный
        private Gamma gammaMethod = new Gamma();  // Метод гаммирования
        private RSA rsaMethod = new RSA();  // Метод RSA
        private ElGamal elGamalMethod = new ElGamal(); ElGamal.Keys keys;
        private DES desMethod = new DES();  // DES метод
         
        public MainForm()
        {
            InitializeComponent();
        }   
        
        private void EncodeButton_Click(object sender, EventArgs e)
        {
            OutputClass.WriteToFile(TranspositionInputBox.Text, inputPath);

            TranspositionEncodeBox.Text = transpositionMetod.Encode(TranspositionInputBox.Text, TranspositionKeyBox.Text, out log);
            OutputClass.WriteToFile(TranspositionEncodeBox.Text, encodePath);
            LogForm form = new LogForm(log);
            form.Show();
        }

        private void DecodeButton_Click(object sender, EventArgs e)
        {
            TranspositionDecodeBox.Text = transpositionMetod.Decode(TranspositionEncodeBox.Text, TranspositionKeyBox.Text, out log);
            OutputClass.WriteToFile(TranspositionDecodeBox.Text, decodePath);
            LogForm form = new LogForm(log);
            form.Show();
        }

        private void VigenereEncodeButton_Click(object sender, EventArgs e)
        {
            OutputClass.WriteToFile(VigenereInputBox.Text, inputPath);

            VigenereEncodeBox.Text = vigereMethod.Encode(VigenereInputBox.Text, VigenereKeyBox.Text, out log);
            OutputClass.WriteToFile(VigenereEncodeBox.Text, encodePath);
            LogForm form = new LogForm(log);
            form.Show();
        }

        private void VigenereDecodeButton_Click(object sender, EventArgs e)
        {
            VigenereDecodeBox.Text = vigereMethod.Decode(VigenereEncodeBox.Text, VigenereKeyBox.Text, out log);
            OutputClass.WriteToFile(VigenereDecodeBox.Text, decodePath);
            LogForm form = new LogForm(log);
            form.Show();
        }

        private void GammaEncodeButton_Click(object sender, EventArgs e)
        {
            OutputClass.WriteToFile(GammaInputBox.Text, inputPath);    
                    
            GammaEncodeBox.Text = gammaMethod.Encode(GammaInputBox.Text, GammaKeyBox.Text, out log);
            OutputClass.WriteToFile(GammaEncodeBox.Text, encodePath);
            LogForm form = new LogForm(log);
            form.Show();
        }

        private void GammaDecodeButton_Click(object sender, EventArgs e)
        {
            GammaDecodeBox.Text = gammaMethod.Decode(GammaEncodeBox.Text, GammaKeyBox.Text, out log);
            OutputClass.WriteToFile(GammaDecodeBox.Text, decodePath);
            LogForm form = new LogForm(log);
            form.Show();
        }

        private void RSAEncodeButton_Click(object sender, EventArgs e)
        {
            OutputClass.WriteToFile(RSAInputBox.Text, inputPath);

            string key1, key2;
            int TotalSum;
            RSAEncodeBox.Text = rsaMethod.Encode(RSAInputBox.Text, out key1, out key2, out log, out TotalSum);
            KeyBox1.Text = key1; KeyBox2.Text = key2;
            OutputClass.WriteToFile(RSAEncodeBox.Text, encodePath);
            LogForm form = new LogForm(log);
            form.Show();
        }

        private void RSADecodeButton_Click(object sender, EventArgs e)
        {
            int TotalSum;
            RSADecodeBox.Text = rsaMethod.Decode(RSAEncodeBox.Text, KeyBox1.Text, KeyBox2.Text, out log, out TotalSum);
            OutputClass.WriteToFile(RSADecodeBox.Text, decodePath);
            LogForm form = new LogForm(log);
            form.Show();
        }

        private void DESEncodeDecodeButton_Click(object sender, EventArgs e)
        {
            OutputClass.WriteToFile(DESInputBox.Text, inputPath);
            byte[] buffer = desMethod.Encode(DESInputBox.Text);
            DESEncodeBox.Text = Encoding.Default.GetString(buffer);
            OutputClass.WriteToFile(DESEncodeBox.Text, decodePath);
            DESDecodeBox.Text = desMethod.Decode(buffer);
            OutputClass.WriteToFile(DESDecodeBox.Text, decodePath);
        }

        private void EDSButton_Click(object sender, EventArgs e)
        {
            EDSForm form = new EDSForm();
            form.Show();
        }

        private void ElGamalEncodeButton_Click(object sender, EventArgs e)
        {
            OutputClass.WriteToFile(ElGamalInputBox.Text, inputPath);

            keys = elGamalMethod.GenerateKeys();

            ElGamalEncodeBox.Text = elGamalMethod.Encode(ElGamalInputBox.Text, keys.PublicKey);
            ElGamalKey1Box.Text = keys.PrivateKey.x.ToString();
            ElGamalKey2Box.Text = keys.PublicKey.g.ToString() + "; " + keys.PublicKey.p.ToString() + "; " + keys.PublicKey.y.ToString();
            OutputClass.WriteToFile(ElGamalEncodeBox.Text, encodePath);            
        }

        private void ElGamalDecodeButton_Click(object sender, EventArgs e)
        {
            ElGamalDecodeBox.Text = elGamalMethod.Decode(ElGamalEncodeBox.Text, keys);
            OutputClass.WriteToFile(ElGamalEncodeBox.Text, decodePath);            
        }              
    }
}
