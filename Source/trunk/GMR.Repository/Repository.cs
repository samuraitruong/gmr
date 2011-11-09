using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Data.Objects;
using System.Linq.Expressions;
using System.Data;
using GMR.Repository;

namespace GMR.Repository
{
    public class Repository<T> : IRepository<T> where T : class
    {

        IObjectSet<T> _objectSet;
        ObjectContext _context;
        public Repository(IObjectContext objectContext)
        {
            _objectSet = objectContext.CreateObjectSet<T>();
            _context = objectContext.GetContext();
        }

        public IQueryable<T> AsQueryable()
        {
            return _objectSet;

        }

        public IEnumerable<T> GetAll()
        {

            return _objectSet.ToList();

        }



        public IEnumerable<T> Find(Expression<Func<T, bool>> where)
        {

            return _objectSet.Where(where);

        }



        public T Single(Expression<Func<T, bool>> where)
        {

            return _objectSet.Single(where);

        }



        public T First(Expression<Func<T, bool>> where)
        {

            return _objectSet.First(where);
            
        }

        public T FirstOrDefault(Expression<Func<T, bool>> where)
        {

            return _objectSet.FirstOrDefault(where);

        }


        public void Delete(T entity)
        {

            _objectSet.DeleteObject(entity);

        }



        public void Add(T entity)
        {

            _objectSet.AddObject(entity);

        }


        public void AttachAsModified(T entity)
        {
            _objectSet.Attach(entity);
            ObjectSet<T> ss = (ObjectSet<T>)_objectSet;
           _context.ObjectStateManager.ChangeObjectState(entity, EntityState.Modified);
            //_objectContext.ObjectStateManager.ChangeObjectState(entity, EntityState.Modified);
        }
        public void Attach(T entity)
        {
            
            _objectSet.Attach(entity);

        }
        protected string GetEntitySetName<T>()
        {

            return String.Format("{0}s", typeof(T).Name);

        }
        private static Type GetBaseType(Type type)
        {
            return type;

            //Type baseType = type.BaseType;
            //if (baseType != null && baseType != typeof(EntityBase))
            //{
            //    return GetBaseType(type.BaseType);
            //}
            //return type;
        }
       

        //public void Update(T entity)
        //{

        //    object originalItem;
        //    EntityKey key = ObjectContext.CreateEntityKey(GetEntitySetName(GetBaseType(typeof(T))), entity);

        //    if (ObjectContext.TryGetObjectByKey(key, out originalItem))
        //    {
        //        ObjectContext.ApplyPropertyChanges(GetEntitySetName(GetBaseType(typeof(T))), entity);
        //    }

        //    //int returnValue = context.SaveChanges();
        //    //ReleaseObjectContextIfNotReused
        //    //// TODO - check if this works
        //    //this.ObjectContext.AttachTo(GetEntitySetName(GetBaseType(typeof(T))), entity);
        //    //this.ObjectContext.SaveChanges();
        //}

    }

}
