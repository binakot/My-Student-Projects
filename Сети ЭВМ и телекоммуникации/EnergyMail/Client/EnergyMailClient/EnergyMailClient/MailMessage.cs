using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Collections;

namespace EnergyMailClient
{
    public enum MailEncodingType  // Тип содержимого сообщения
    {
        PLAINTEXT,
        HTML
    }

    public enum MailSendPriority  // Приоритет сообщения
    {
        HIGH,
        NORMAL,
        LOW
    }

    public class MailMessage  // Класс сообщения
    {        
        private string from;  // От кого
        private string to;  // Кому       
        private string subject;  // Тема
        private string message;  // Текст сообщения  
        private MailEncodingType mailEncodingType;  // Тип содержимого
        private MailSendPriority mailSendPriority;  // Приоритет
        
        // Конструкторы
        public MailMessage()
        {
            this.from = "";
            this.to = "";           
            this.subject = "";
            this.message = "";
            this.mailEncodingType = MailEncodingType.PLAINTEXT;
            this.mailSendPriority = MailSendPriority.NORMAL;
        }       

        public MailMessage(string from, string recipient, string subject, string body)
        {
            this.from = from;
            this.to = recipient;           
            this.subject = subject;
            this.message = body;
            this.mailEncodingType = MailEncodingType.PLAINTEXT;
            this.mailSendPriority = MailSendPriority.NORMAL;  
        }

        // Свойства
        public string From
        {
            get
            {
                return this.from;
            }
            set
            {
                this.from = value;
            }
        }

        public string To
        {
            get
            {
                return this.to;
            }
            set
            {
                this.to = value;
            }
        }
        
        public string Subject
        {
            get
            {
                return this.subject;
            }
            set
            {
                this.subject = value;
            }
        }

        public string Message
        {
            get
            {
                return this.message;
            }
            set
            {
                this.message = value;
            }     
        }

        public MailEncodingType MailType
        {
            get
            {
                return this.mailEncodingType;
            }
            set
            {
                this.mailEncodingType = value;
            }
        }

        public MailSendPriority MailPriority
        {
            get
            {
                return this.mailSendPriority;
            }
            set
            {
                this.mailSendPriority = value;
            }
        }
    }
}
