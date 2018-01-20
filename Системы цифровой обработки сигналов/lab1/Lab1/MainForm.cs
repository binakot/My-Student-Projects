using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;
using System.Windows.Forms.DataVisualization.Charting;

namespace Lab1
{
    public partial class MainForm : Form
    {
        // Параметры сигнала
        double amplitude;  // Амплитуда        
        double frequency;  // Частота
        double phase;  // Фаза

        // Параметры дискретизации
        double delta;  // Интервал дискретизации
        double quant;  // Шаг квантавания

        // Общие переменные
        double t;  // Текущий момент времени
        const double period = 10;  // Рассматриваемый промежуток времени    
    
        // Переменные постоения аналогого сигнала            
        const int step_count = 100;  // Количество точек графика
        const double step = period / step_count;  // Шаг во времени    

        public MainForm()
        {
            InitializeComponent();
        }

        private void AnalogGraphicButton_Click(object sender, EventArgs e)
        {
            // ПЕРВЫЙ СИГНАЛ

            // Считываем параметры сигнала
            amplitude = Convert.ToDouble(AmplitudeEdit1.Text);
            phase = Convert.ToDouble(PhaseEdit1.Text);
            frequency = Convert.ToDouble(FrequencyEdit1.Text);            

            // Строим аналоговый сигнал 
            Series analogGraphic1 = AnalogSignalCharts.Series[0];
            analogGraphic1.Points.Clear();  // Очищаем график            

            t = 0;

            for (int i = 0; i < step_count; i++)
            {
                double f = amplitude * Math.Cos(frequency * t + phase);  // Вычисляем значение фукнции волны f в момент времени t
                analogGraphic1.Points.AddXY(t, f);  // Строим точку
                t += step;  // Увеличиваем время
            }

            AnalogSignalCharts.ChartAreas[0].AxisX.RoundAxisValues();

            // ВТОРОЙ СИГНАЛ

            // Считываем параметры сигнала
            amplitude = Convert.ToDouble(AmplitudeEdit2.Text);
            phase = Convert.ToDouble(PhaseEdit2.Text);
            frequency = Convert.ToDouble(FrequencyEdit2.Text);

            // Строим аналоговый сигнал 
            Series analogGraphic2 = AnalogSignalCharts.Series[1];
            analogGraphic2.Points.Clear();  // Очищаем график            

            t = 0;

            for (int i = 0; i < step_count; i++)
            {
                double f = amplitude * Math.Cos(frequency * t + phase);  // Вычисляем значение фукнции волны f в момент времени t
                analogGraphic2.Points.AddXY(t, f);  // Строим точку
                t += step;  // Увеличиваем время
            }

            AnalogSignalCharts.ChartAreas[0].AxisX.RoundAxisValues();

            // ТРЕТИЙ СИГНАЛ

            // Считываем параметры сигнала
            amplitude = Convert.ToDouble(AmplitudeEdit3.Text);
            phase = Convert.ToDouble(PhaseEdit3.Text);
            frequency = Convert.ToDouble(FrequencyEdit3.Text);

            // Строим аналоговый сигнал 
            Series analogGraphic3 = AnalogSignalCharts.Series[2];
            analogGraphic3.Points.Clear();  // Очищаем график            

            t = 0;

            for (int i = 0; i < step_count; i++)
            {
                double f = amplitude * Math.Cos(frequency * t + phase);  // Вычисляем значение фукнции волны f в момент времени t
                analogGraphic3.Points.AddXY(t, f);  // Строим точку
                t += step;  // Увеличиваем время
            }

            AnalogSignalCharts.ChartAreas[0].AxisX.RoundAxisValues();

            // ВЫХОДНОЙ СИГНАЛ

            // Считываем параметры сигнала
            amplitude = Convert.ToDouble(AmplitudeEdit1.Text) + Convert.ToDouble(AmplitudeEdit2.Text) + Convert.ToDouble(AmplitudeEdit3.Text);
            phase = Convert.ToDouble(PhaseEdit1.Text) + Convert.ToDouble(PhaseEdit2.Text) + Convert.ToDouble(PhaseEdit3.Text);
            frequency = Convert.ToDouble(FrequencyEdit1.Text);

            // Строим аналоговый сигнал 
            Series analogGraphic4 = AnalogSignalChart.Series[0];
            analogGraphic4.Points.Clear();  // Очищаем график            

            t = 0;

            for (int i = 0; i < step_count; i++)
            {
                double f = amplitude * Math.Cos(frequency * t + phase);  // Вычисляем значение фукнции волны f в момент времени t
                analogGraphic4.Points.AddXY(t, f);  // Строим точку
                t += step;  // Увеличиваем время
            }

            AnalogSignalChart.ChartAreas[0].AxisX.RoundAxisValues();

            // Амплитудные спектры
            Series spectre = SpectresChart.Series[0];
            spectre.Points.Clear();
            spectre.Points.AddXY(Convert.ToDouble(FrequencyEdit1.Text), Convert.ToDouble(AmplitudeEdit1.Text));

            spectre = SpectresChart.Series[1];
            spectre.Points.Clear();
            spectre.Points.AddXY(Convert.ToDouble(FrequencyEdit2.Text), Convert.ToDouble(AmplitudeEdit2.Text));

            spectre = SpectresChart.Series[2];
            spectre.Points.Clear();
            spectre.Points.AddXY(Convert.ToDouble(FrequencyEdit3.Text), Convert.ToDouble(AmplitudeEdit3.Text));
                        
            spectre = SpectresChart.Series[3];
            spectre.Points.Clear();
            spectre.Points.AddXY(frequency, amplitude); 
        }

        private void DiscretizationButton_Click(object sender, EventArgs e)
        {
            // Считываем параметры дискретизации
            delta = Convert.ToDouble(DeltaEdit.Text);
            quant = Convert.ToDouble(QuantEdit.Text);

            // Переменные посроение дискретного сигнала 
            double dis_step_count = period / delta;  // Количество точек графика дискретизации
            double quant_step_count = period / quant;  // Количество точек графика квантавания

            FullEnergyEdit.Text = (Convert.ToDouble(AmplitudeEdit1.Text) * Convert.ToDouble(AmplitudeEdit1.Text) +
                                    Convert.ToDouble(AmplitudeEdit2.Text) * Convert.ToDouble(AmplitudeEdit2.Text) +
                                    Convert.ToDouble(AmplitudeEdit3.Text) * Convert.ToDouble(AmplitudeEdit3.Text)).ToString();  // Полная энергия
            
            // Строим дискретный сигнал 
            // Строим график аналогого сигнала
            Series discreteGraphic1 = DiscreteSignalChart.Series[0];
            discreteGraphic1.Points.Clear();  // Очищаем график

            t = 0;           

            for (int i = 0; i < step_count; i++)
            {
                double f = amplitude * Math.Cos(frequency * t + phase);  // Вычисляем значение фукнции волны f в момент времени t
                discreteGraphic1.Points.AddXY(t, f);  // Строим точку
                t += step;  // Увеличиваем время
            }
            // Стоим график дискретного сигнала
            Series discreteGraphic2 = DiscreteSignalChart.Series[1];
            discreteGraphic2.Points.Clear();  // Очищаем график
            discreteGraphic2["PixelPointWidth"] = "2";

            t = 0;

            for (int i = 0; i < dis_step_count; i++)
            {
                double f = amplitude * Math.Cos(frequency * t + phase);  // Вычисляем значение фукнции волны f в момент времени t
                discreteGraphic2.Points.AddXY(t, f);  // Строим точку
                t += delta;  // Увеличиваем время
            }


            // Строим цифровой сигнал
            // Строим график аналогого сигнала
            Series digitalGraphic1 = DigitalSignalChart.Series[0];
            digitalGraphic1.Points.Clear();  // Очищаем график

            t = 0;

            for (int i = 0; i < step_count; i++)
            {
                double f = amplitude * Math.Cos(frequency * t + phase);  // Вычисляем значение фукнции волны f в момент времени t
                digitalGraphic1.Points.AddXY(t, f);  // Строим точку
                t += step;  // Увеличиваем время
            }
            Series standart = chart2.Series[0];
            standart.Points.Clear();  // Очищаем график            
            standart.Points.Add(SpectresChart.Series[0].Points[0]);
            standart.Points.Add(SpectresChart.Series[1].Points[0]);
            standart.Points.Add(SpectresChart.Series[2].Points[0]);            
            // Стоим график цифрового сигнала
            Series digitalGraphic2 = DigitalSignalChart.Series[1];
            digitalGraphic2.Points.Clear();  // Очищаем график           

            t = 0;

            for (int i = 0; i < quant_step_count; i++)
            {
                double f = amplitude * Math.Cos(frequency * t + phase);  // Вычисляем значение фукнции волны f в момент времени t
                digitalGraphic2.Points.AddXY(t, Math.Round(f));  // Строим точку
                t += quant;  // Увеличиваем время
            }

            DiscreteSignalChart.ChartAreas[0].AxisX.RoundAxisValues();
            DigitalSignalChart.ChartAreas[0].AxisX.RoundAxisValues();


            // Быстрое преобразование Фурье
            
             // Считываем параметры сигнала
            amplitude = Convert.ToDouble(AmplitudeEdit1.Text) + Convert.ToDouble(AmplitudeEdit2.Text) + Convert.ToDouble(AmplitudeEdit3.Text);
            phase = Convert.ToDouble(PhaseEdit1.Text) + Convert.ToDouble(PhaseEdit2.Text) + Convert.ToDouble(PhaseEdit3.Text);
            frequency = Convert.ToDouble(FrequencyEdit1.Text);

            t = 0;
            double[] Input = new double[step_count];
            for (int i = 0; i < step_count; i++)
            {
                Input[i] = amplitude * Math.Cos(frequency * t + phase);  // Вычисляем значение фукнции волны f в момент времени t 
                t += step;  // Увеличиваем время
            }

            // Выполняем преобразование фурье
            alglib.complex[] FourierMass;
            alglib.fftr1d(Input, out FourierMass);

            double[] Output = new double[step_count];

            alglib.complex[] yr = FourierMass;            
            double[] yrr = new double[step_count];
            double[] xrr = new double[step_count];

            alglib.fftr1dinv(FourierMass, out Output);

            Series resultGraph = chart1.Series[0];
            resultGraph.Points.Clear();  // Очищаем график

            t = 0;
            for (int i = 0; i < step_count; i++)
            {
                xrr[i] = i;
                yrr[i] = Math.Sqrt(Math.Pow(yr[i].x, 2) + Math.Pow(yr[i].y, 2)) / step_count;
                
                t += step;  // Увеличиваем время                
                
                chart2.Series[1].Points.AddXY(xrr[i], yrr[i]);  // Строим точку   
                resultGraph.Points.AddXY(t, Output[i]);
            }          
        }  
    }

    /*

    // Фурте
        private alglib.complex[] GetFourier1(double[] Input)
        {
            alglib.complex[] FourierMass;
            alglib.fftr1d(Input, out FourierMass);
            return FourierMass;
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
     * 
     * */
}
