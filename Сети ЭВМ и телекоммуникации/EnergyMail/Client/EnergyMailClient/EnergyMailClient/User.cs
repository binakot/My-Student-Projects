using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace EnergyMailClient
{
    static public class User  // Класс пользователя
    {
        public static String Login;  // Логин пользователя
        public static String Password;  // Пароль пользователя     

        public static String flag;  // Флаг для регистрации
        public static String newLogin;  // Новый логин при занятости введенного при регистрации
    }
}
