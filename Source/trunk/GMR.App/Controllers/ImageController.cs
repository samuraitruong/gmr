using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using GMR.Biz.Helpers;
using System.IO;
using GMR.Biz.Models;

namespace GMR.App.Controllers
{
    public class ImageController : Controller
    {
        //
        // GET: /Image/

        public ActionResult Logo(string Name)
        {
            string path = Path.Combine( GMRSetting.LogoPath, Name);
            if (string.IsNullOrEmpty(Name) || !System.IO.File.Exists(path)) path = GMRSetting.NoLogo;
            return base.File(path, "image/jpeg");
        }

        public ActionResult View(string Name)
        {
            
            string path = Path.Combine(GMRSetting.ImagePath, Name);
            if (string.IsNullOrEmpty(Name) || !System.IO.File.Exists(path)) path = GMRSetting.NoLogo;
            return base.File(path, "image/jpeg");
        }
           
        //
        // GET: /Image/Details/5

        public ActionResult Details(int id)
        {
            return View();
        }

        //
        // GET: /Image/Create

        public ActionResult Create()
        {
            return View();
        } 

        //
        // POST: /Image/Create

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
        // GET: /Image/Edit/5
 
        public ActionResult Edit(int id)
        {
            return View();
        }

        //
        // POST: /Image/Edit/5

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
        // GET: /Image/Delete/5
 
        public ActionResult Delete(int id)
        {
            return View();
        }

        //
        // POST: /Image/Delete/5

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
