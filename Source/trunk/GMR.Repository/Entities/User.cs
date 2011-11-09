using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace GMR.Repository
{
   public partial class User
    {
       public User CreatedBy
       {
           get { return this.User1; }
           set { this.User1 = value;}
       }
    }
}
