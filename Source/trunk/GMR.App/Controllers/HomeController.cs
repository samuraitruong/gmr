using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using GMR.App.Models;
using GMR.App.Areas.Administration.Models;
using System.Web.Security;
using GMR.Common;
using GMR.Biz;
using GMR.App.Utilities;
using GMR.Repository;
using GMR.Common.EF;
using GMR.Common.Extensions;
using GMR.App.Areas.Administration.Controllers;
using PagedList;
using GMR.Common.Crawling;

namespace GMR.App.Controllers
{
    public class HomeController : FOController
    {
        
        public ActionResult Beta()
        {
            return RedirectToAction("Index");
            MarketPriceService service = new MarketPriceService();
            BetaHomeModel model = new BetaHomeModel()
            {
                //LiveMarketPrices = service.GetPaged(p => p.MarketPriceID > 0, new IOrderByClause<MarketPrice>[] { new OrderByClause<MarketPrice, DateTime>(p => p.UpdateDateTime.Value, SortDirection.Decending) }, 1, 50)
                LiveMarketPrices = service.GetLivePrices()
            };
           
            return View(model);
        }
        public ActionResult Demo()
        {
            return RedirectToAction("Index", "Content", new { Area = "Content" });
        }
        public ActionResult Index_bak()
        {
            //ViewBag.Message = "Default password is 123456  ("+ SecurityHelper.HashPassword("123456") +")";

            //return View();
           
            
            return RedirectToAction("Beta");
        }

        public ActionResult Index()
        {
             MarketPriceService service = new MarketPriceService();
             NewsService newsSvr = new NewsService();
            Category category =  null;

            List<News> news = newsSvr.GetLastestMarketInfoNews(out category);

             HomePageModel model = new HomePageModel()
             {
                 LiveMarketPrices = service.GetLivePrices(),
                 LastestMarketInfoNews = news,
                 MarketInfoCategory = category,
             };

             return View(model);
            
        }
        public ActionResult About()
        {
            return View();
        }
        public ActionResult ClientLogin()
        {
            return View();
        }
        private void persistUser(UserInfo user, bool rememberMe)
        {
            // Create ticket
            FormsAuthenticationTicket ticket = new FormsAuthenticationTicket(
                1,
                user.FullName,
                DateTime.Now,
                DateTime.Now.AddMinutes(3),
                true,
                BuiltinRoles.Partner.ToString(),
                FormsAuthentication.FormsCookiePath);

            // Create encrypted cookie
            string hash = FormsAuthentication.Encrypt(ticket);
            HttpCookie cookie = new HttpCookie(FormsAuthentication.FormsCookieName, hash);
            if (ticket.IsPersistent)
            {
                cookie.Expires = ticket.Expiration;
            }

            // Set and done
            Response.Cookies.Add(cookie); //Necessary, otherwise UserData property gets lost
        }
        [HttpPost]
        public ActionResult ClientLogin(LoginModel model)
        {
            if (ModelState.IsValid)
            {
                // Get user info
                var user = UserService.ValidateUser(model.Username, model.Password);
               
                //IUserManager manager = ManagerFactory.Create(this._repository, model.CategoryID);
                if (user != null && user.UserID > 0)
                {
                    UserInfo info = UIHelper.BuildUserInfo(user);
                    SessionManager.UserInfo = info;
                    persistUser(info, model.RememberMe);

                    return RedirectToAction("Restricted", "Dashboard", new { Area="Administration"});
                }
                else
                {
                    ViewData["Message"] = string.Format(
                        "Tên hoặc mật khẩu không đúng. vui lòng kiểm tra lại!");

                    return View(model);
                }
            }

            return View(model);
        }
    }
}
