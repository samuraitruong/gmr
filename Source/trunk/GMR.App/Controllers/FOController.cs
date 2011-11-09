using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using GMR.App.Models;
using GMR.App.Areas.Administration.Models;
using GMR.Biz;
using GMR.Repository;
using GMR.Common.EF;
using GMR.Common.Crawling;
using System.Runtime.Caching;

namespace GMR.App.Areas.Administration.Controllers
{
    
    public class FOController : Controller
    {
        protected override void Initialize(System.Web.Routing.RequestContext requestContext)
        {
            base.Initialize(requestContext);
            //string controller = requestContext.RouteData.Values["controller"].ToString();
            //string action = requestContext.RouteData.Values["action"].ToString();
            //string area = "Administration";

            //if (SessionManager.UserInfo!= null && SessionManager.UserInfo.PartnerId > 0)
            //{
            //    controller = "Home";
            //    action="ClientLogin";
            //    area="";
            //}
            GMRService<Category> service = new GMRService<Category>();
          
            this.ViewData.Add(Constants.ViewData.MainMenu, new MainMenuModel()
            {
                Categories = service.GetPaged(p => !p.ParentCategoryID.HasValue,
                 new IOrderByClause<Category>[] {new OrderByClause<Category, int> (p=>p.CategoryID, SortDirection.Ascending),
                },
                 1,
                 100)
            });

            NewsService newsSvr = new NewsService();
            List<News> news = newsSvr.GetLastestSMSAccessNews();
            this.ViewData.Add(Constants.ViewData.LastestSMSNews, news);

            List<News> MarqueeNews = newsSvr.GetLastestMaqueeNews();
            this.ViewData.Add(Constants.ViewData.MarqueeNews, MarqueeNews);

            string GoldOrgKey = "GOLDORG";
            var data = MemoryCache.Default[GoldOrgKey];
            if (data == null)
            {
                GoldOrgCrawler crawler = new GoldOrgCrawler();
                data = crawler.GetstrapTools();

                MemoryCache.Default.Add(GoldOrgKey, data, DateTime.Now.AddMinutes(1));
            }

            this.ViewData.Add("GoldOrgPrice", data);
            
        }
        //
        // GET: /Administration/GMRBase/

        public FOController() : base(){
            
        }  

    }
}
