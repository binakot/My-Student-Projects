using System;
using System.Windows.Forms;
using System.Collections.Generic;
using Jenyay.Mathematics;

using ChartType = System.Windows.Forms.DataVisualization.Charting.SeriesChartType;

namespace DSPS2._0
{
    public partial class Form2 : Form
    {
        Form1 mainForm;
        SendForm sendForm;
        MathEvaluator mathEvaluator = new MathEvaluator();
        ChartType[] chartTypes = new ChartType[] { ChartType.StepLine, ChartType.Spline, ChartType.Point };

        int PointCount = 256;
        byte printState = 0;    
        bool[] printChart = new bool[9];

        List<ChartCoordinates> listChartCoordinates   = new List<ChartCoordinates>();
        List<ChartCoordinates> listSChartCoordinates  = new List<ChartCoordinates>();
        List<ChartCoordinates> listSTChartCoordinates = new List<ChartCoordinates>();

        public Form2(SendForm sendFormMain)
        {
            InitializeComponent();
            sendForm = sendFormMain;
        }

        private void Form2_Shown(object sender, EventArgs e)
        {
            ChartCoordinates newCC; ;
            for (int i = 0; i < sendForm.vFuncs.Count; i++)
                if (sendForm.vFuncs[i] != "")
                        getChartCoordinates(sendForm.vFuncs[i]);
                else
                {
                    newCC = new ChartCoordinates(PointCount);
                    listChartCoordinates.Add(newCC);
                    AddFourierInList();
                    AddInvFourierInList(); 
                }

            newCC = new ChartCoordinates(PointCount);
            newCC.SetX(listChartCoordinates[0].GetX());
            newCC.SetY(Add2Func(0, 1));
            listChartCoordinates.Add(newCC);
            AddFourierInList();
            AddInvFourierInList(); 


            newCC = new ChartCoordinates(PointCount);
            newCC.SetX(listChartCoordinates[0].GetX());
            newCC.SetY(Add2Func(2, 3));
            listChartCoordinates.Add(newCC);
            AddFourierInList();
            AddInvFourierInList(); 

            newCC = new ChartCoordinates(PointCount);
            newCC.SetX(listChartCoordinates[0].GetX());
            if (sendForm.i != -1 || sendForm.j != -1)
                newCC.SetY(GDI(sendForm.i, sendForm.j, sendForm.k));
            else 
                if (sendForm.k != -1)
                {
                    newCC.SetY(setOne());
                }
            listChartCoordinates.Add(newCC);
            AddFourierInList();
            AddInvFourierInList(); 

            newCC = new ChartCoordinates(PointCount);
            newCC.SetX(listChartCoordinates[0].GetX());
            double[] y1 = listChartCoordinates[4].GetY();
            double[] y2 = listChartCoordinates[5].GetY();
            newCC.SetY(Mull2Func(y1, y2));
            listChartCoordinates.Add(newCC);
            AddFourierInList();
            AddInvFourierInList();
            Filter();
        }


        private void Filter()
        {
            ChartCoordinates spect8 = new ChartCoordinates(PointCount);
            ChartCoordinates signl8 = new ChartCoordinates(PointCount);
            double[] invY;
            double[] yy = new double[PointCount];
            double[] y = listChartCoordinates[listChartCoordinates.Count - 1].GetY();
            double[] x = listChartCoordinates[listChartCoordinates.Count - 1].GetX();
            double[] xx = listSChartCoordinates[listSChartCoordinates.Count - 1].GetX();
            alglib.complex[] compY = GetFourier1(y);
            double limF = 1 / (2 * Math.PI * sendForm.R * sendForm.C) * 1000000;

            for (int i = 0; i < PointCount; i++)
            {
                if (limF < xx[i])
                {
                    yy[i] = 0;
                    compY[i] = 0;                            
                }   
                else
                    yy[i] = Math.Sqrt(Math.Pow(compY[i].x, 2) + Math.Pow(compY[i].y, 2)) / PointCount;
            }
            spect8.SetX(xx);
            spect8.SetY(yy);

            alglib.fftr1dinv(compY, out invY);
            signl8.SetX(x);
            signl8.SetY(invY);

            listChartCoordinates.Add(signl8);
            listSChartCoordinates.Add(spect8);
            listSTChartCoordinates.Add(signl8);
        }

        private double[] Mull2Func(double[] y1, double[] y2)
        {
            double[] result = new double[PointCount];
            for (int i = 0; i < PointCount; i++)
                result[i] = y1[i] * y2[i];
            return result;
        }

        private double[] GDI(int x1, int x2, double x3)
        {
            double[] result = new double[PointCount];
            for (int i = 0; i < PointCount; i += x1 * 20)
                for (int j = i; j < i+x2; j++)
                    result[j] = x3;
            return result;
        }

        private double[] Add2Func(int index1, int index2)
        { 
            double[] x  = listChartCoordinates[index1].GetX();
            double[] y1 = listChartCoordinates[index1].GetY();
            double[] y2 = listChartCoordinates[index2].GetY();
            double[] result = new double[PointCount];

            for (int i = 0; i < PointCount; i++)
                result[i] = y1[i] + y2[i];
            return result;
        }

        private void ClearOneChart(string number)
        {
            chart1.Series[number].Points.Clear();                    
        }

        private void ClearChart(int LowerBound, int UpperBound)
        {
            for (int i = LowerBound; i < UpperBound; i++)
                ClearOneChart(i.ToString());
        }

        private void getChartCoordinates(string func)
        {
            func = checkRightFunc(func);
            listChartCoordinates.Add(getResultsFunction(func));
            AddFourierInList();
            AddInvFourierInList();
        }

        private void AddFourierInList()
        {
            double[] y = listChartCoordinates[listChartCoordinates.Count - 1].GetY();
            listSChartCoordinates.Add(getFourierFunction(y));        
        }

        private void AddInvFourierInList()
        {
            double[] y = listChartCoordinates[listChartCoordinates.Count - 1].GetY();
            listSTChartCoordinates.Add(getInvFourierFunction(y));
        }

        private string checkRightFunc(string func) 
        {
            if (func.Contains("sin"))
                func = func.Replace("sin", "Math.sin");
            if (func.Contains("PI"))
                func = func.Replace("PI", "Math.PI");
            return func;
        }

        private ChartCoordinates getResultsFunction(string func) 
        { 
            string buffString = "";
            ChartCoordinates result = new ChartCoordinates(PointCount);
            double[] x = new double[PointCount];
            double[] y = new double[PointCount];

            for (int i = 0; i < PointCount; i++)
            {
                x[i] = 0.1 / PointCount * i;
                buffString = func.Replace("x", x[i].ToString().Replace(',', '.'));
                y[i] = Microsoft.JScript.Convert.ToNumber(this.mathEvaluator.Evaluate(buffString));
                /*x[(int)j] = i;
                buffString = func.Replace("x", x[(int)j].ToString().Replace(',', '.'));
                y[(int)j] = Microsoft.JScript.Convert.ToNumber(this.mathEvaluator.Evaluate(buffString));*/
            }
            result.SetX(x);
            result.SetY(y);
            return result;
        }

        private ChartCoordinates getFourierFunction(double[] y)
        {
            ChartCoordinates result = new ChartCoordinates(PointCount);

            alglib.complex[] yr = GetFourier1(y);
            //Complex[] yr = GetFourier(y);
            double[] yrr = new double[PointCount];
            double[] xrr = new double[PointCount];

            for (int i = 0; i < PointCount; i++)
            {
                yrr[i] = Math.Sqrt(Math.Pow(yr[i].x, 2) + Math.Pow(yr[i].y, 2)) / PointCount;
                //yrr[i] = yr[i].Abs;
                xrr[i] = i / 0.1;
            }
            result.SetX(xrr);
            result.SetY(yrr);
            return result;
        }

        private ChartCoordinates getInvFourierFunction(double[] y)
        {
            double[] xrr  = new double[PointCount];
            double[] yrr  = new double[PointCount];
            double[] invY;
            ChartCoordinates result = new ChartCoordinates(PointCount);
            /*Complex[] yy = Fourier.FFT(y);
            Complex[] yy1 = Fourier.IFFT(yy);*/
            alglib.fftr1dinv(GetFourier1(y), out invY);

            for (int i = 0; i < PointCount; i++)
            {
                xrr[i] = 0.1 / PointCount * i;
                yrr[i] = invY[i];
            }
            result.SetX(xrr);
            result.SetY(yrr);
            return result;
        }
        
        private void PrintCharts()
        {
            double[] x = new double[PointCount];
            double[] y = new double[PointCount];

            ClearChart(1, 10);
            for (int i = 0; i < printChart.GetUpperBound(0); i++)
            {
                if (printChart[i])
                {
                    switch (printState)
                    {
                        case 0: 
                            try
                            {
                                x = listChartCoordinates[i].GetX();
                                y = listChartCoordinates[i].GetY();
                                for (int j = 0; j < x.GetUpperBound(0); j++)
                                    chart1.Series[(i + 1).ToString()].Points.AddXY(x[j], y[j]);
                            }
                            catch (Exception e)
                            {
                            }
                            break;
                        case 1:
                            try
                            {
                                x = listSChartCoordinates[i].GetX();
                                y = listSChartCoordinates[i].GetY();
                                for (int j = 0; j < (x.GetUpperBound(0) / 2); j++)
                                    chart1.Series[(i + 1).ToString()].Points.AddXY(x[j], y[j]);
                            }
                            catch (Exception e)
                            {
                            }
                            break;
                        case 2:
                            try
                            {
                                x = listSTChartCoordinates[i].GetX();
                                y = listSTChartCoordinates[i].GetY();
                                for (int j = 0; j < (x.GetUpperBound(0)); j++)
                                    chart1.Series[(i + 1).ToString()].Points.AddXY(x[j], y[j]);
                            }
                            catch (Exception e)
                            {
                            }
                            break;
                    }
                }
            }
        }

        private Complex[] GetFourier(double[] Input)
        {
            Complex[] FourierMass = Fourier.FFT(Input);
            return FourierMass;
        }

        private alglib.complex[] GetFourier1(double[] Input)
        {
            alglib.complex[] FourierMass;
            alglib.fftr1d(Input, out FourierMass);
            return FourierMass;
        }

        private double[] setOne()
        {
            double[] result = new double[PointCount];
            for (int i = 0; i < PointCount; i++)
                result[i] = 1;
            return result;
        }

        #region 
        private void checkBox1_CheckedChanged(object sender, EventArgs e)
        {
            if (checkBox1.Checked)
                printChart[0] = true;
            else
                printChart[0] = false;
            PrintCharts();
        }

        private void checkBox2_CheckedChanged(object sender, EventArgs e)
        {
            if (checkBox2.Checked)
                printChart[1] = true;
            else
                printChart[1] = false;
            PrintCharts();
        }

        private void checkBox3_CheckedChanged(object sender, EventArgs e)
        {
            if (checkBox3.Checked)
                printChart[2] = true;
            else
                printChart[2] = false;
            PrintCharts();
        }

        private void checkBox4_CheckedChanged(object sender, EventArgs e)
        {
            if (checkBox4.Checked)
                printChart[3] = true;
            else
                printChart[3] = false;
            PrintCharts();
        }

        private void checkBox5_CheckedChanged(object sender, EventArgs e)
        {
            if (checkBox5.Checked)
                printChart[4] = true;
            else
                printChart[4] = false;
            PrintCharts();
        }

        private void checkBox6_CheckedChanged(object sender, EventArgs e)
        {
            if (checkBox6.Checked)
                printChart[5] = true;
            else
                printChart[5] = false;
            PrintCharts();
        }

        private void checkBox7_CheckedChanged(object sender, EventArgs e)
        {
            if (checkBox7.Checked)
                printChart[6] = true;
            else
                printChart[6] = false;
            PrintCharts();
        }

        private void checkBox8_CheckedChanged(object sender, EventArgs e)
        {
            if (checkBox8.Checked)
                printChart[7] = true;
            else
                printChart[7] = false;
            PrintCharts();
        }

        private void checkBox9_CheckedChanged(object sender, EventArgs e)
        {
            if (checkBox9.Checked)
                printChart[8] = true;
            else
                printChart[8] = false;
            PrintCharts();
        }

        private void comboBox1_SelectedIndexChanged(object sender, EventArgs e)
        {
            chart1.Series["1"].ChartType = chartTypes[comboBox1.SelectedIndex];
        }

        private void comboBox2_SelectedIndexChanged(object sender, EventArgs e)
        {
            chart1.Series["2"].ChartType = chartTypes[comboBox2.SelectedIndex];
        }

        private void comboBox3_SelectedIndexChanged(object sender, EventArgs e)
        {
            chart1.Series["3"].ChartType = chartTypes[comboBox3.SelectedIndex];
        }

        private void comboBox4_SelectedIndexChanged(object sender, EventArgs e)
        {
            chart1.Series["4"].ChartType = chartTypes[comboBox4.SelectedIndex];
        }

        private void comboBox5_SelectedIndexChanged(object sender, EventArgs e)
        {
            chart1.Series["5"].ChartType = chartTypes[comboBox5.SelectedIndex];
        }

        private void comboBox6_SelectedIndexChanged(object sender, EventArgs e)
        {
            chart1.Series["6"].ChartType = chartTypes[comboBox6.SelectedIndex];
        }

        private void comboBox7_SelectedIndexChanged(object sender, EventArgs e)
        {
            chart1.Series["7"].ChartType = chartTypes[comboBox7.SelectedIndex];
        }

        private void comboBox8_SelectedIndexChanged(object sender, EventArgs e)
        {
            chart1.Series["8"].ChartType = chartTypes[comboBox8.SelectedIndex];
        }

        private void comboBox9_SelectedIndexChanged(object sender, EventArgs e)
        {
            chart1.Series["9"].ChartType = chartTypes[comboBox9.SelectedIndex];
        }

        private void radioButton1_CheckedChanged(object sender, EventArgs e)
        {
            if (radioButton1.Checked)
                printState = 0;
            PrintCharts();
        }

        private void radioButton2_CheckedChanged(object sender, EventArgs e)
        {
            if (radioButton2.Checked)
                printState = 1;
            PrintCharts();
        }

        private void radioButton3_CheckedChanged(object sender, EventArgs e)
        {
            if (radioButton3.Checked)
                printState = 2;
            PrintCharts();
        }
        #endregion

    }

    public class ChartCoordinates
    { 
        double[] X;
        double[] Y;

        public ChartCoordinates(int upperbound)
        {
            X = new double[upperbound];
            Y = new double[upperbound];
        }

        public double[] GetX() 
        {
            return X;
        }

        public void SetX(double[] x)
        {
            X = x;
        }

        public double[] GetY()
        {
            return Y;
        }

        public void SetY(double[] y)
        {
            Y = y;
        }
    }
}
