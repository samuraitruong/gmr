using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using GMR.App.Controllers.Attributes;
using GMR.Biz;
using GMR.Common.EF;
using GMR.Repository;
using GMR.App.Models;
using GMR.Biz.Models;
using GMR.App.Areas.Administration.Models;

namespace GMR.App.Areas.Administration.Controllers
{
    public class PriceController : GMRBaseController
    {
        //
        // GET: /Administration/Price/

        [Authorize]
        [EnsureSession]
        [HasRights ( Right= Permissions.Read)]
        public ActionResult Index(int? id, int? Type,int? Page=1)
        {
            MarketPriceService service = new MarketPriceService();
            IndexPriceModel model = new IndexPriceModel()
            {
                PartnerId = id,
                Type = Type,
                Prices = service.GetPaged(p => id.HasValue? p.PartnerID==id: p.MarketPriceID>0 && (Type.HasValue? p.SymbolNameID== Type.Value: true),
                //Prices = service.GetPaged(p => p.MarketPriceID>0,
                new IOrderByClause<MarketPrice>[] { new OrderByClause<MarketPrice, DateTime>(p => p.UpdatedDate.Value, SortDirection.Decending) }, Page.HasValue?Page.Value:1, GMRSetting.PageSize)
            };

            return View(model);
        }

        //
        // GET: /Administration/Price/Details/5

        public ActionResult Details(int id)
        {
            return View();
        }

        //
        // GET: /Administration/Price/Create

        public ActionResult Create()
        {
            return View();
        } 

        //
        // POST: /Administration/Price/Create

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
        // GET: /Administration/Price/Edit/5
 
        public ActionResult Edit(int id)
        {
            return View();
        }

        //
        // POST: /Administration/Price/Edit/5

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
        // GET: /Administration/Price/Delete/5
 
        public ActionResult Delete(int id)
        {
            return View();
        }

        //
        // POST: /Administration/Price/Delete/5

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
