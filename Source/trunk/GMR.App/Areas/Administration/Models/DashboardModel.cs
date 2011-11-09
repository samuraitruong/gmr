using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using GMR.Repository;
using PagedList;

namespace GMR.App.Areas.Administration.Models
{
    public class DashboardModel
    {
    }
    public class DashBoardRestrictedModel
    {
       public PagedList<MarketPrice> MarketkPrices {get;set;}
    }
}