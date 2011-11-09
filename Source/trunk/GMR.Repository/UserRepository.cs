using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace GMR.Repository
{
    public class UserRepository : Repository<User>
    {
        public UserRepository(IObjectContext context) : base(context) { }
    }
}
