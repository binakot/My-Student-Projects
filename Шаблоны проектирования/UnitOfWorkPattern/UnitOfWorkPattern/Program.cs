using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace UnitOfWorkPattern
{
    class Program
    {
        static void Main(string[] args)
        {
            UOW<Customer> ouw1 = new UOW<Customer>();

            Customer obj = new Customer();
            obj.Id = 1000;
            obj.CustomerName = "Batman";            
            ouw1.Add(obj);

            obj = new Customer();
            obj.Id = 2000;
            obj.CustomerName = "Spiderman";
            ouw1.Add(obj);

            ouw1.Commit();            
        }
    }
}
