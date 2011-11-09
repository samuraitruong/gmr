using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using GMR.Biz;
using GMR.App.Areas.Administration.Models;
using GMR.App.Models;
using GMR.Repository;
using GMR.Common.EF;
using GMR.App.Controllers.Attributes;

namespace GMR.App.Areas.Administration.Controllers
{
    public class DashboardController : GMRBaseController
    {
        //
        // GET: /Administration/Dashboard/
        [Authorize]
        [EnsureSession( RedirectToClientLogin=true)]
        public ActionResult Restricted()
        {
            MarketPriceService service = new MarketPriceService();
            DashBoardRestrictedModel model = new DashBoardRestrictedModel()
            {

                MarketkPrices = service.GetPaged(p => p.PartnerID == SessionManager.UserInfo.PartnerId,
                new  IOrderByClause<MarketPrice>[] { new OrderByClause<MarketPrice, long>(p=>p.MarketPriceID, SortDirection.Decending) } , 1, 50)
            };

            return View(model);
        }
        [IgnorePartner]
        [Authorize]
        [EnsureSession]
        public ActionResult Index()
        {
            return View();
        }

    }
}
