using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace GMR.Repository
{
    public class DistrictRepository : Repository<District>
    {
        public DistrictRepository(IObjectContext context) : base(context) { }
    }
}
