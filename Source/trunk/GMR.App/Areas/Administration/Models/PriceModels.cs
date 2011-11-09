using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using GMR.Repository;
using PagedList;

namespace GMR.App.Areas.Administration.Models
{
    public class IndexPriceModel
    {
        public int? PartnerId { get; set; }
        public int? Type { get; set; }

        public PagedList<MarketPrice> Prices { get; set; }
    }
}