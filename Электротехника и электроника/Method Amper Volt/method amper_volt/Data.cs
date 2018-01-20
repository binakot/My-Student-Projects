using System;
using System.Collections.Generic;
using System.Text;

namespace method_amper_volt
{
    class Data
    {
        // Источник тока
        public static Double EaMin = 0; // Выходной ток источника тока 
        public static Double EaMax = 5; // Диапозон min-max
        public static Double EvMin = 0; // Выходное напряжение источника тока
        public static Double EvMax = 30; // Диапозон min-max
        // Амперметр
        public static Double AMin = 0;
        public static Double AMax = 15;
        public static Double AvalOfDiv = (AMin + AMax) / 10;
        // Вольметр
        public static Double VMin = 0;
        public static Double VMax = 100;
        public static Double VvalOfDiv = (VMin + VMax) / 10;  
    }
}
