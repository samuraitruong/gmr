using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using PagedList;
using GMR.Repository;

namespace GMR.App.Models
{
    public class BetaHomeModel
    {
        public PagedList<MarketPrice> LiveMarketPrices { get; set; } 
    }
    public class HomePageModel
    {

        public PagedList<MarketPrice> LiveMarketPrices { get; set; }

        public List<News> LastestMarketInfoNews { get; set; }

        public Category MarketInfoCategory { get; set; }
    }
}