using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using GMR.Repository;
using GMR.Common;
namespace GMR.Biz
{
    public class GroupService : GMRService<Group>
    {
        public Group GetById(int id)
        {
            return FirstOrDefault(p => p.GroupID == id);
        }
       
    }
    
}
