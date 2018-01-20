using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Data.SqlClient;
using System.Data;
using System.Transactions;

namespace UnitOfWorkPattern
{
    public interface IEntity
    {
        int Id { set; get; }
        void Insert();
        void Update();
        List<IEntity> Load();
    }

    public class UOW<T> where T : IEntity
    {
        private List<T> Changed = new List<T>();
        private List<T> New = new List<T>();

        public void Add(T obj)
        {
            New.Add(obj);
        }

        public void Commit()
        {
            using (TransactionScope scope = new TransactionScope())
            {
                foreach (T o in Changed)
                {
                    o.Update();
                }
                foreach (T o in New)
                {
                    o.Insert();
                }
                scope.Complete();
            }
        }

        public void Load(IEntity o)
        {
            Changed = o.Load() as List<T>;
        }

        public void Add(IEntity obj)
        {
            throw new NotImplementedException();
        }
    }    
}
