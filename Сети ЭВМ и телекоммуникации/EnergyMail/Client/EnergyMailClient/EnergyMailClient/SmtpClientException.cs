using System;
using System.Collections.Generic;
using System.Text;

namespace EnergyMailClient
{
    public class SmtpClientException : Exception  // Класс исключений для SmtpClient
    {
        private string errorMessage = "";

        public SmtpClientException(string error_message)
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
