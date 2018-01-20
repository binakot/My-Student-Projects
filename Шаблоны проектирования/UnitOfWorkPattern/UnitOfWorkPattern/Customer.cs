using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Data.SqlClient;
using System.Data;
using System.Transactions;

namespace UnitOfWorkPattern
{
    public class Customer : IEntity
    {
        private int _CustomerCode = 0;

        public int Id
        {
            get { return _CustomerCode; }
            set { _CustomerCode = value; }
        }

        private string _CustomerName = "";

        public string CustomerName
        {
            get { return _CustomerName; }
            set { _CustomerName = value; }
        }

        public void Insert()
        {
            DataAccess obj = new DataAccess();
            obj.InsertCustomer(_CustomerCode, CustomerName);
        }

        public List<IEntity> Load()
        {
            DataAccess obj = new DataAccess();
            Customer o = new Customer();
            SqlDataReader ds = obj.GetCustomer(Id);
            while (ds.Read())
            {
                o.CustomerName = ds["CustomerName"].ToString();
            }
            List<IEntity> Li = (new List<Customer>()).ToList<IEntity>();
            Li.Add((IEntity)o);
            return Li;
        }

        public void Update()
        {
            DataAccess obj = new DataAccess();
            obj.UpdateCustomer(_CustomerCode, CustomerName);
        }
    }
}
