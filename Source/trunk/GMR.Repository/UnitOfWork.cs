using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using GMR.Common;

namespace GMR.Repository
{
    interface IUnitOfWork
    {

        void Commit();

    }



    public class UnitOfWork : IUnitOfWork, IDisposable
    {

        private readonly IObjectContext _objectContext;



        public UnitOfWork(IObjectContext objectContext)
        {

            _objectContext = objectContext;

        }



        public void Dispose()
        {

            if (_objectContext != null)
            {

                _objectContext.Dispose();

            }

            GC.SuppressFinalize(this);

        }



        public void Commit()
        {
            try
            {
                _objectContext.SaveChanges();
            }
            catch (Exception ex)
            {
                Logger.Log(ex);
                throw ex;
            }
            

        }

    }
}
