using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Windows.Forms;

namespace WindowsFormsApplication1
{
    public partial class Form1 : Form
    {
        const Int32 PowerOftables = 3000000;  //Размер хеш-таблицы
        const Int32 NumberOfKeys = 1000000;   //Кол-во ключей для вставки
        const Int32 RandomRange = 10000;   //Диапозон ГСЧ

        Random rnd = new Random();  //ГСЧ

        Int32 aKey;       
        Link dataItem; 
        DataItem Data;  

        HashChain HT1 = new HashChain(PowerOftables);
        HashLinear HT2 = new HashLinear(PowerOftables);
        HashTableWithDoubleHashing HT3 = new HashTableWithDoubleHashing(PowerOftables);

        public Form1()
        {
            InitializeComponent();
        }

        private void button1_Click(object sender, EventArgs e)
        { 
            for (int i = 0; i < NumberOfKeys; i++)
            {
                aKey = rnd.Next(RandomRange) + 1;
                dataItem = new Link(aKey);
                Data = new DataItem(aKey);
                HT1.Insert(dataItem);
                HT2.insert(Data);
                HT3.insert(aKey, Data);
            }
        }

        private void button2_Click(object sender, EventArgs e)
        {
            Int32 Count = 0;
            Int32 cur = 0;            

            for (int i = 0; i < RandomRange; i++)
            {
                cur = HT1.FindCount(i);
                if (cur != -1)
                    Count += cur;
            }  
          
            textBox1.Text = (Count / NumberOfKeys).ToString();

            Count = 0;
            cur = 0;

            for (int i = 0; i < RandomRange; i++)
            {
                cur = HT2.FindCount(i);
                if (cur != -1)
                    Count += cur;
            }

            textBox2.Text = (Count / NumberOfKeys).ToString();

            Count = 0;
            cur = 0;

            for (int i = 0; i < RandomRange; i++)
            {
                cur = HT3.FindCount(i);
                if (cur != -1)
                    Count += cur;
            }

            textBox3.Text = (Count / NumberOfKeys).ToString();              
        }
    }
}
