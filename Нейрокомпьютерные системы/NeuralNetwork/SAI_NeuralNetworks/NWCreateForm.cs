using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Windows.Forms;

namespace NeuralNetworks
{    
    public partial class NWCreateForm : Form
    {
        // Счетчик для настройки нейронов в скрытых слоях
        NumericUpDown[] NLayers;
        // Метки скытых слоев
        Label[] NLayerLabels;
        // Количество скрытых слоев
        int countLayers = 0;

        public static int[] layers;  // Скрытые слои и слой выхода

        public static int sizeX;  // Количество входов  

        public NWCreateForm()
        {
            InitializeComponent();
        }

        public int[] getLayers
        {
            get 
            {
                return layers;
            }
        }

        public int getSizeX
        {
            get 
            {
                return sizeX;
            }
        }    

        // Создать НС
        private void CreateButton_Click(object sender, EventArgs e)
        {
            layers = new int[countLayers + 1];

            sizeX = (int)InputCountNumeric.Value;

            for (int i = 0; i < countLayers; i++)
                layers[i] = (int)NLayers[i].Value;

            layers[countLayers] = (int)OutputCountNumeric.Value;

            Close();
        }

        // Увеличение/уменьшение количества скрытых слоев
        private void HideLayerCountNumeric_ValueChanged(object sender, EventArgs e)
        {
            try
            {
                CreateNumeric();
            }
            finally
            {

            }
        }

        // Изменить количество скрытых слоев
        void CreateNumeric()
        {
            for (int i = 0; i < countLayers; i++)
            {
                this.CreateBox.Controls.Remove(this.NLayers[i]);
                this.CreateBox.Controls.Remove(this.NLayerLabels[i]);
            }

            countLayers = (int)HideLayerCountNumeric.Value;

            NLayers = new NumericUpDown[countLayers];
            NLayerLabels = new Label[countLayers];

            for (int i = 0; i < countLayers; i++)
            {
                // Создаем счетчик слоев
                NLayers[i] = new NumericUpDown();

                NLayers[i].Left = 6;
                NLayers[i].Top = 71 + 39 * i;

                NLayers[i].Maximum = 10000;
                NLayers[i].Minimum = 1;

                this.CreateBox.Controls.Add(this.NLayers[i]);

                // Создаем Метку i-го скрытого слоя
                NLayerLabels[i] = new Label();
                NLayerLabels[i].Top = 55 + 39 * i;
                NLayerLabels[i].Left = 6;
                NLayerLabels[i].Text = "Нейронов в " + Convert.ToString(i + 1) + " слое: ";
                NLayerLabels[i].AutoSize = true;

                this.CreateBox.Controls.Add(this.NLayerLabels[i]);
            }
        }        
    }
}
