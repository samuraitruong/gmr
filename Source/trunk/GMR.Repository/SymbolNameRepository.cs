using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace GMR.Repository
{
    public class SymbolTypeRepository : Repository<SymbolType>
    {
        public SymbolTypeRepository(IObjectContext context) : base(context) { }
    }
}
