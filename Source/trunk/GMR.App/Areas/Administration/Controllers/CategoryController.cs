using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using GMR.App.Areas.Administration.Models;
using GMR.Biz;
using GMR.Repository;
using GMR.Common.EF;
using GMR.App.Controllers.Attributes;
using GMR.Biz.Models;
using GMR.Common;

namespace GMR.App.Areas.Administration.Controllers
{
    public class CategoryController : GMRBaseController
    {
        //
        // GET: /Administration/Category/

        public ActionResult Index()
        {
            GMRService<Category> service = new GMRService<Category>();
            IndexCategoryModel model = new IndexCategoryModel(){
                Categories = service.GetPaged(p=>p.CategoryID>0 , new IOrderByClause<Category>[] { new OrderByClause<Category, int>(p => p.CategoryID, SortDirection.Decending)},
                1,100)
            };

            return View(model);
        }

        //
        // GET: /Administration/Category/Details/5

        public ActionResult Details(int id)
        {
            return View();
        }

        //
        // GET: /Administration/Category/Create
        [EnsureSession]
        [HasRights(Permissions.Create)]
        public ActionResult Create()
        {
            return View();
        } 

        //
        // POST: /Administration/Category/Create

        [HttpPost]
        [EnsureSession]
        [HasRights(Permissions.Create)]
        public ActionResult Create(CreateCategoryModel model)
        {
            try

            {
                if(ModelState.IsValid){

                    Category cat = new Category()
                    {
                        CategoryName = model.Name,
                        ParentCategoryID = model.ParentCategoryID,
                        AccessTypes = model.AccessTypes,
                        CreatedDate =DateTime.Now,
                        UpdatedDate = DateTime.Now,
                    };
                    CategoryService service = new CategoryService();
                    service.AddCategory(cat);
                    return RedirectToAction("Index");

                };
                // TODO: Add insert logic here

               
            }
            catch (Exception ex)
            {
                Logger.Log(ex);
                ModelState.AddModelError("Error", "Có lỗi hệ thống xãy ra. không thể thêm dữ liệu.");
                
            }
            return View(model);
        }
        
        //
        // GET: /Administration/Category/Edit/5
 
        public ActionResult Edit(int id)
        {
            CategoryService service = new CategoryService();
            Category cat = service.GetById(id);
            EditCategoryModel model = new EditCategoryModel()
            {
                Id = cat.CategoryID,
                Name =cat.CategoryName,
                ParentCategoryID =cat.ParentCategoryID,
                AccessTypes = cat.AccessTypes
            };
            return View(model);
        }

        //
        // POST: /Administration/Category/Edit/5

        [HttpPost]
        public ActionResult Edit(int id, EditCategoryModel model)
        {
            try
            {
                CategoryService service = new CategoryService();
                if (ModelState.IsValid)
                {
                    service.Edit(id, model.Name, model.ParentCategoryID, model.AccessTypes);
                    return RedirectToAction("Index");
                }
            }
            catch(Exception ex)
            {
                ModelState.AddModelError("Error", ex);
            }
            return View(model);
        }

        //
        // GET: /Administration/Category/Delete/5
 
        public ActionResult Delete(int id)
        {
            return View();
        }

        //
        // POST: /Administration/Category/Delete/5

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
