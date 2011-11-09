using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using GMR.Repository;

namespace GMR.Biz
{
   public class ContextManager
    {
       private static GMREntities context;
       public static GMREntities GetInstance() {
           if (context == null) context = new GMREntities();

           return context;
       }
    }
}
