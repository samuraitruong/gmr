using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using GMR.App.Areas.Administration.Models;
using GMR.Repository;
using GMR.App.Models;
using GMR.Biz;
using GMR.App.Controllers.Attributes;
using GMR.Common.Extensions;



namespace GMR.App.Areas.Administration.Controllers
{
    public class MarketPriceController : GMRBaseController
    {
        //
        // GET: /Administration/MarketPrices/

        [HttpPost]
        
        public ActionResult GetChange(int symbolId)
        {
            try
            {
                 MarketPriceService service = new MarketPriceService();
            var open = service.GetFirstPriceOfDay(SessionManager.UserInfo.PartnerId, symbolId, DateTime.Now);
            var close = service.GetLastPriceOfDay(SessionManager.UserInfo.PartnerId, symbolId, DateTime.Now.AddDays(-1));
            var data= new {
                OpenPrice = open!= null?open.CurrBuyPrice:0,
                ClosePrice =close!= null?close.CurrBuyPrice:0
            };
            return Json(data);
            }
            catch (Exception ex)
            {
                 var data= new {
                 Exception = ex.Message + ex.StackTrace + ex.InnerException,
                OpenPrice =0,
                ClosePrice =0
            };
                 return Json(data);
            }
            return Json(true);
        }
        public ActionResult Index()
        {
            return View();
        }

        //
        // GET: /Administration/MarketPrices/Details/5

        public ActionResult Details(int id)
        {
            return View();
        }

        //
        // GET: /Administration/MarketPrices/Create

        public ActionResult Create()
        {
            return View();
        } 

        //
        // POST: /Administration/MarketPrices/Create

        [HttpPost]
        [EnsureSession(RedirectToClientLogin=true)]
        public ActionResult Create(CreateMarketPriceModel marketPrice)
        {
            try
            {
                // TODO: Add insert logic here

                if (ModelState.IsValid)
                {
                    MarketPrice price = new MarketPrice() { 
                        //AdjustedRate = marketPrice.AdjustedRate,
                        CreatedUserID = SessionManager.UserInfo.UserID,
                        
                        CurrBuyPrice = marketPrice.CurrBuyPrice,
                        CurrSellPrice = marketPrice.CurrSellPrice,
                        DailyClosePrice = marketPrice.DailyClosePrice,
                        DailyOpenPrice = marketPrice.DailyOpenPrice,
                        PlaceID = marketPrice.PlaceId,
                        SymbolNameID = marketPrice.SymbolNameId,
                        UpdateDateTime = DateTime.Now,
                        UpdatedDate = DateTime.Now,
                        UpdatedUserID = SessionManager.UserInfo.UserID,
                        CreatedDate = DateTime.Now
                        
                    };
                    if (SessionManager.UserInfo.PartnerId > 0) price.PartnerID = SessionManager.UserInfo.PartnerId;

                    MarketPriceService service = new MarketPriceService();
                    
                    service.AddNewPrice(price);
                    return RedirectToAction("Restricted", "Dashboard");
                }
              
               
            }
            catch
            {
                
            }
            return View(marketPrice);
           
        }
        
        //
        // GET: /Administration/MarketPrices/Edit/5

        [EnsureSession(RedirectToClientLogin = true)]
        public ActionResult Edit(int id)
        {
            var item = MarketPriceService.GetById( id);
            if (item.PartnerID.HasValue && item.PartnerID != SessionManager.UserInfo.PartnerId)
            {
                return RedirectToAction("AccessDenied", "Secure");
            }
            EditMarketPriceModel model = new EditMarketPriceModel();
            model.CopyPropertiesFrom(item);

            return View(model);
           
        }

        //
        // POST: /Administration/MarketPrices/Edit/5

        [HttpPost]
        [EnsureSession(RedirectToClientLogin = true)]
        public ActionResult Edit(int id, EditMarketPriceModel model)
        {
            try
            {
                if (ModelState.IsValid)
                {

                    MarketPrice price = new MarketPrice()
                    {
                        MarketPriceID = model.Id,
                        
                        UpdatedUserID = SessionManager.UserInfo.UserID,
                        PlaceID = model.PlaceId,
                        SymbolNameID = model.SymbolNameId
                        
                    };
                    price.CopyPropertiesFrom(model);
                    MarketPriceService service = new MarketPriceService();
                    service.Update(price);
                    return RedirectToAction("Restricted", "Dashboard");
                }
            }
            catch
            {
                ModelState.AddModelError("Error", "Lỗi hệ thống - không thể cập nhật dữ liệu");
            }
            return View(model);
        }

        //
        // GET: /Administration/MarketPrices/Delete/5
 
        public ActionResult Delete(int id)
        {
            try
            {
                MarketPriceService service = new MarketPriceService();
                service.Delete(id, SessionManager.UserInfo.PartnerId);

                // TODO: Add delete logic here


            }
            catch (Exception ex)
            {
                
            }
            return RedirectToAction("Restricted", "Dashboard");
        }

        //
        // POST: /Administration/MarketPrices/Delete/5

        [HttpPost]
        public ActionResult Delete(int id, FormCollection collection)
        {
            try
            {
                MarketPriceService service = new MarketPriceService();
                service.Delete(id, SessionManager.UserInfo.PartnerId);
                
                // TODO: Add delete logic here
 
                return RedirectToAction("Restricted", "Dashboard");
            }
            catch
            {
                return View();
            }
        }
    }
}
