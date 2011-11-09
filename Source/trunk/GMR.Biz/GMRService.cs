using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using GMR.Repository;
using System.Linq.Expressions;
using GMR.Common;
using PagedList;
using System.Reflection;
using GMR.Common.EF;


namespace GMR.Biz
{
    public class GMRService<T>:IGMRService<T> where  T:class
    {
        public UnitOfWork UnitOfWork;
        public Repository<T> Repository;
        public GMREntities Context;
        public GMRService()
        {
            PrepareContext();
        }
        public virtual T Add(T entity)
        {
            //PrepareContext();
            Repository.Add(entity);
            UnitOfWork.Commit();
            return entity;
        }

        public virtual T Delete(T entity)
        {
            //PrepareContext();
            Repository.Delete(entity);
            UnitOfWork.Commit();
            return entity;
        }

        private void PrepareContext()
        {
            Context = ContextManager.GetInstance();
            var contextAdapter = new ObjectContextAdapter(Context);
            UnitOfWork = new UnitOfWork(contextAdapter);
            Repository = new Repository<T>(contextAdapter);
            
        }


        public void AttachAsModified(T entity)
        {
            try
            {
                Repository.AttachAsModified(entity);
            }
            catch (Exception ex)
            {

                throw ex;
            }
            finally
            {
                //unitOfWork.Commit();
            }

        }

        public void Attach(T entity)
        {
            IQueryable<T> query;
            var context = ContextManager.GetInstance();
            var contextAdapter = new ObjectContextAdapter(context);
            var unitOfWork = new UnitOfWork(contextAdapter);
            var repository = new Repository<T>(contextAdapter);

            try
            {
                repository.Attach(entity);
            }
            catch (Exception ex)
            {

                throw ex;
            }
            finally
            {
                unitOfWork.Commit();
            }

        }
        public void UpdateChanges()
        {
            IQueryable<T> query;
            var context = ContextManager.GetInstance();
            var contextAdapter = new ObjectContextAdapter(context);
            var unitOfWork = new UnitOfWork(contextAdapter);
            var repository = new Repository<T>(contextAdapter);
            
            try
            {
                //repository.Attach(entity);
            }
            catch (Exception ex)
            {

                throw ex;
            }
            finally
            {
                unitOfWork.Commit();
            }
        }


        public IQueryable<T> GetQuery()
        {
            IQueryable<T> query;
            var context = ContextManager.GetInstance();
            var contextAdapter = new ObjectContextAdapter(context);
            var unitOfWork = new UnitOfWork(contextAdapter);
            var repository = new Repository<T>(contextAdapter);

            try
            {
              query = repository.AsQueryable();
            }
            catch (Exception ex)
            {

                throw ex;
            }
            finally
            {
                //unitOfWork.Commit();
            }
            return query;
        }


        public IEnumerable<T> GetAllItems()
        {
            IEnumerable<T> query;
            var context = ContextManager.GetInstance();
            var contextAdapter = new ObjectContextAdapter(context);
            var unitOfWork = new UnitOfWork(contextAdapter);
            var repository = new Repository<T>(contextAdapter);

            try
            {
                query = repository.GetAll();
            }
            catch (Exception ex)
            {
                Logger.Log(ex);
                throw ex;
            }
            finally
            {
                unitOfWork.Commit();
            }
            return query;
        }
       
        public PagedList<T> GetPaged(Expression<Func<T, bool>> where, IOrderByClause<T>[] orderBy , int pagenum, int pagesize)
        {
            IQueryable<T> query = null; 
            //var context = ContextManager.GetInstance();
            //var contextAdapter = new ObjectContextAdapter(context);
            //var unitOfWork = new UnitOfWork(contextAdapter);
            //var repository = new Repository<T>(contextAdapter);

            try
            {
                query = Repository.AsQueryable().Where(where);
                if (orderBy != null)
                {
                    bool isFirstSort = true;
                    orderBy.ToList().ForEach(one =>
                    {
                        query = one.ApplySort(query, isFirstSort);
                        isFirstSort = false;
                    });
                }

                return (PagedList<T>)query.ToPagedList(pagenum, pagesize);
            }
            catch (Exception ex)
            {
                Logger.Log(ex);
                throw ex;
            }
            finally
            {
                //UnitOfWork.Commit();
            }
            return (PagedList<T>)query.ToPagedList(pagenum, pagesize);
        }
        /// <summary>
        /// Get the first item match with where conditional, if not return null but without throw exepton
        /// </summary>
        /// <param name="where"></param>
        /// <returns></returns>
        public T FirstOrDefault(Expression<Func<T, bool>> where)
        {
            T query;
            //var context = ContextManager.GetInstance();
            //var contextAdapter = new ObjectContextAdapter(context);
            //var unitOfWork = new UnitOfWork(contextAdapter);
            //var repository = new Repository<T>(contextAdapter);

            try
            {
                query = Repository.FirstOrDefault(where);
            }
            catch (Exception ex)
            {
                Logger.Log(ex);
                throw ex;
            }
            finally
            {
                //UnitOfWork.Commit();
            }
            return query;
        }



        public T First(Expression<Func<T, bool>> where)
        {
            T query;

            try
            {
                query = Repository.First(where);
            }
            catch (Exception ex)
            {
                Logger.Log(ex);
                throw ex;
            }
            finally
            {
               // UnitOfWork.Commit();
            }
            return query;
        }
    }
}
