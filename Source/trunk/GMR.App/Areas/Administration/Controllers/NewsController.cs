using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using GMR.App.Areas.Administration.Models;
using GMR.Biz;
using GMR.Common.EF;
using GMR.Repository;
using GMR.App.Models;
using GMR.App.Controllers.Attributes;
using GMR.Common.Extensions;
using GMR.Biz.Models;
using GMR.Common;

namespace GMR.App.Areas.Administration.Controllers
{
    public class NewsController : GMRBaseController
    {
        //
        // GET: /Administration/News/
        [EnsureSession]
        [Authorize]
        [HasRights(Right=Permissions.Read)]
        public ActionResult Index(int? id, int? Page)
        {
   
            NewsService serivce = new NewsService();
            string status = EntityStates.Activated.ToString();
            NewsIndexModel model = new NewsIndexModel()
            {
                NewsItems = serivce.GetPaged(p => p.Status == status &&(id.HasValue? p.News_CategoryID== id.Value:true)
                 , new IOrderByClause<News>[] { new OrderByClause<News, int>(p => p.NewsID, SortDirection.Decending) },
                    Page.HasValue ? Page.Value : 1,
                    GMRSetting.PageSize)

            };
            return View(model);
        }

        //
        // GET: /Administration/News/Details/5

        public ActionResult Details(int id)
        {
            return View();
        }

        //
        // GET: /Administration/News/Create
        [EnsureSession]
        [HasRights( Right = Permissions.Create)]
        public ActionResult Create()
        {
            return View();
        } 

        //
        // POST: /Administration/News/Create

        [HttpPost]
        [EnsureSession]
        [HasRights(Right = Permissions.Read)]
        [ValidateInput(false)]
          public ActionResult Create(CreateNewsModel model, FormCollection collection, HttpPostedFileBase PreviewImage)
        {
            try
            {
                if (ModelState.IsValid)
                {
                    News news = new News() {
                        Subject = model.Subject,
                        Headline = model.Headline,
                        Content = model.Content,
                        Author = model.Author,
                        Source = model.Source,
                        News_CategoryID = model.CategoryId,
                        CreatedUserID =SessionManager.UserInfo.UserID,
                        SMSChannel = model.SMSChannel,
                        ViewCount = 0,
                    };
                    //HttpPostedFileBase file = HttpContext.Request.Files["Image"];
                    new NewsService().AddNews(news, PreviewImage);
                    return RedirectToAction("Index");

                }
                // TODO: Add insert logic here

               
            }
            catch(Exception ex)
            {
                Logger.Log(ex);
               ModelState.AddModelError("Error500","Không thể cập nhật tin.");
            }
            return View(model);
        }
        
         [EnsureSession]
         [HasRights(Permissions.Read)]
        public ActionResult View(int id)
        {
            NewsService service = new NewsService();
            var data = service.FirstOrDefault(p => p.NewsID == id);
            ViewNewsModel model = new ViewNewsModel()
            {

                NewsItem = data,
            };
             return View(model);
        }
        //
        // GET: /Administration/News/Edit/5
 
        [EnsureSession]
        [HasRights(Permissions.Edit)]
        public ActionResult Edit(int id)
        {
            NewsService service = new NewsService();
            var data= service.FirstOrDefault(p=>p.NewsID == id);
            EditNewsModel model = new EditNewsModel();

            model.CopyPropertiesFrom(data);
            model.CategoryId = data.News_CategoryID;
            return View(model);
        }

        //
        // POST: /Administration/News/Edit/5

        [HttpPost]
        [EnsureSession]
        [ValidateInput(false)]
        [HasRights(Permissions.Edit)]
        public ActionResult Edit(int id, EditNewsModel model, FormCollection collection, HttpPostedFileBase PreviewImage)
        {
            try
            {
                if (ModelState.IsValid)
                {
                    News ns = new News();
                    ns.CopyPropertiesFrom(model);
                    ns.News_CategoryID = model.CategoryId;

                    NewsService service = new NewsService();
                    ns.UpdatedUserID = SessionManager.UserInfo.UserID;
                    service.Edit(ns, PreviewImage);
                    return RedirectToAction("Index");
                }
            }
            catch (Exception ex) {
                ModelState.AddModelError("Error500", "Có lỗi hệ thống - không cập nhật được dữ liệu.");
            }

            return View(model);
           
        }

        //
        // GET: /Administration/News/Delete/5
         [HasRights(Permissions.Full)]
        public ActionResult Delete(int id)
        {
            NewsService serivce = new NewsService();
            serivce.DeleteNews(id);
            return RedirectToAction("Index");
        }

        //
        // POST: /Administration/News/Delete/5

        [HttpPost]
        [HasRights(Permissions.Full)]
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
