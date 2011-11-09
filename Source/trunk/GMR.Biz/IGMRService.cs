using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Linq.Expressions;

namespace GMR.Biz
{
    public interface IGMRService <T> where T : class
    {
        T Add(T entity);
        IQueryable<T> GetQuery();
        void Attach(T entity);
        void UpdateChanges();
        IEnumerable<T> GetAllItems();
        T First(Expression<Func<T, bool>> where);
        T FirstOrDefault(Expression<Func<T, bool>> where);
        void AttachAsModified(T entity);
    }
}
