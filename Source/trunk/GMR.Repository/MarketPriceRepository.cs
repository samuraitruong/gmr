using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace GMR.Repository
{
    public class MarketPriceRepository : Repository<MarketPrice>
    {
        public MarketPriceRepository(IObjectContext context) : base(context) { }
    }
}
