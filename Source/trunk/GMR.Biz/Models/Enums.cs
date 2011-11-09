using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace GMR.Biz.Models
{
    public enum Permissions
    {
        Full,
        Read,
        Create,
        Edit,
        SA
    }
    public enum AccessTypes{
        Free,
        Login,
        SMS
    }
}
