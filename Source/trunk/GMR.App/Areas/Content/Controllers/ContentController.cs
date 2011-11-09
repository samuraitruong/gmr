using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using GMR.App.Areas.Content.Models;
using GMR.Biz;
using GMR.Repository;
using GMR.Common.EF;
using GMR.App.Areas.Administration.Controllers;
using GMR.App.Models;

namespace GMR.App.Areas.Content.Controllers
{
    public class ContentController : FOController
    {
        // GET: /Content/Home/
        [HttpGet]
        public ActionResult SMS(string Source)
        {
            SMSAccessModel model = new SMSAccessModel() { 
            Source =  Source
            };
            return View();
        }

        [HttpPost]
        public ActionResult VerifySMSAccess(string Source)
        {
            AccessInfo info = new AccessInfo() { 
            LastAccess = DateTime.Now,
            SMSCode = "CODE"
            };
            SessionManager.AccessInfo = info;
            SessionManager.SMSVerified = true;
            return Redirect(Source);
            //return View();
        }

        public ActionResult ViewNewsById(int    id)
        {
            NewsService service = new NewsService();

            News item = service.GetById(id);
            List<News> relatedNews = service.GetRelatedNews(item.NewsID);
            ContentViewNewsModel model = new ContentViewNewsModel()
            {
                Category = item.Category,
                NewsItem = item,
                SubCategories = item.Category.Categories1.ToList(),
                RelatedNews = relatedNews

            };
            return View(model);
        }
        //[AllowAccess]
        public ActionResult ViewNews(string news)
        {
            NewsService service = new NewsService();
            
            News item = service.GetNewsByKey(news);
            if (item.ViewCount.HasValue)
            {
                item.ViewCount = item.ViewCount++;
            }
            else
            {
                item.ViewCount = 1;
            }

            List<News> relatedNews = service.GetRelatedNews(item.NewsID);
            ContentViewNewsModel model = new ContentViewNewsModel()
            {
                Category = item.Category,
                NewsItem = item,
                SubCategories = item.Category.Categories1.ToList(),
                RelatedNews = relatedNews

            };
            return View(model);
        }
        public ActionResult ViewCategoryById(int id)
        {
            CategoryService service = new CategoryService();
            Category cat = service.GetById(id);
            ViewCategoryModel model = new ViewCategoryModel()
            {
                Category = cat,
                SubCategories = cat.Categories1.ToList(),
            };
            return View(model);
        }
        public ActionResult ViewCategory(string category, int Page=1)
        {
            CategoryService service = new CategoryService();
            Category cat = service.GetByStaticName(category);
            NewsService newsSvc = new NewsService();
            string status = EntityStates.Activated.ToString();

            var paged = newsSvc.GetPaged(p=>p.Status == status && p.News_CategoryID ==  cat.CategoryID,
                new IOrderByClause<News>[] {new OrderByClause<News, DateTime>(p=>p.UpdateDate.Value, SortDirection.Decending)},
                Page, 20
                );

            ViewCategoryModel model = new ViewCategoryModel()
            {
                Category = cat,
                SubCategories = cat.Categories1.ToList(),
                LastedNewsPaged = paged,
                LastestNews = paged.ToList(),
            };
            return View(model);
        }
        public ActionResult Index()
        {
            GMRService<Category> service = new GMRService<Category>();
            HomeContentModel model = new HomeContentModel();

            return View(model);
        }

        //
        // GET: /Content/Home/Details/5

        public ActionResult Details(int id)
        {
            return View();
        }

        //
        // GET: /Content/Home/Create

        public ActionResult Create()
        {
            return View();
        } 

        //
        // POST: /Content/Home/Create

        [HttpPost]
        public ActionResult Create(FormCollection collection)
        {
            try
            {
                // TODO: Add insert logic here

                return RedirectToAction("Index");
            }
            catch
            {
                return View();
            }
        }
        
        //
        // GET: /Content/Home/Edit/5
 
        public ActionResult Edit(int id)
        {
            return View();
        }

        //
        // POST: /Content/Home/Edit/5

        [HttpPost]
        public ActionResult Edit(int id, FormCollection collection)
        {
            try
            {
                // TODO: Add update logic here
 
                return RedirectToAction("Index");
            }
            catch
            {
                return View();
            }
        }

        //
        // GET: /Content/Home/Delete/5
 
        public ActionResult Delete(int id)
        {
            return View();
        }

        //
        // POST: /Content/Home/Delete/5

        [HttpPost]
        public ActionResult Delete(int id, FormCollection collection)
        {
            try
            {
                // TODO: Add delete logic here
 
                return RedirectToAction("Index");
            }
            catch
            {
                return View();
            }
        }
    }
}
