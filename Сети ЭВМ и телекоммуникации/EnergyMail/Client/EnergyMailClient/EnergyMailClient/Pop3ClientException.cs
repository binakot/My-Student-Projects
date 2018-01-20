using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Windows.Forms;

namespace EnergyMailClient
{
    public class Pop3ClientException : Exception  // Класс исключений для PopClient
    {
        private string errorMessage = "";

        public Pop3ClientException(string error_message)
        {
            this.errorMessage = error_message;            
        }

        public string ErrorMessage
        {
            get
            {
                return this.errorMessage;
            }
        }
    }
}
