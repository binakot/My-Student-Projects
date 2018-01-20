using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Data;
using System.Data.SqlClient;

namespace UnitOfWorkPattern
{
    public class DataAccess
    {
        private string ConnectionString = @"Data Source=COMP\SQLSERVER;Initial Catalog=Customer;Integrated Security=True";

        public bool InsertCustomer(int CustomerCode, string CustomerName)
        {
            SqlConnection objConn = new SqlConnection(ConnectionString);
            try
            {
                objConn.Open();
                string str = "insert into Customer values(" + CustomerCode + ",'" + CustomerName + "')";
                SqlCommand objCommand = new SqlCommand(str, objConn);
                objCommand.ExecuteNonQuery();
                objConn.Close();
            }
            catch (Exception ex)
            {
                throw ex;
            }

            return true;
        }

        public SqlDataReader GetCustomer(int CustomerCode)
        {
            SqlConnection objConn = new SqlConnection(ConnectionString);
            objConn.Open();
            string str = "select * from Customer where CustomerCode=" + CustomerCode;
            SqlCommand objCommand = new SqlCommand(str, objConn);
            return objCommand.ExecuteReader();
        }

        public bool UpdateCustomer(int CustomerCode, string CustomerName)
        {
            SqlConnection objConn = new SqlConnection(ConnectionString);
            objConn.Open();
            string str = "Update  Customer set CustomerName='" + CustomerName + "' where CustomerCode=" + CustomerCode;
            SqlCommand objCommand = new SqlCommand(str, objConn);
            objCommand.ExecuteNonQuery();
            objConn.Close();
            return true;
        }
    }
}
