using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using GMR.App.Areas.Administration.Models;
using GMR.Biz;
using GMR.Common.EF;
using GMR.Repository;
using GMR.App.Utilities;
using GMR.App.Models;
using GMR.App.Controllers.Attributes;
using GMR.Biz.Models;

namespace GMR.App.Areas.Administration.Controllers
{
    public class PartnerController : GMRBaseController
    {
        public ActionResult MyAccount()
        {
            return View();
        }

        [HttpPost]
        public ActionResult MyAccount(MyAccountModel model)
        {
            if (ModelState.IsValid)
            {
                UserService service = new UserService();
                if (!service.ChangePassword(SessionManager.UserInfo.UserID, model.OldPassword, model.Password))
                {
                    ModelState.AddModelError("Error", "Mật khẩu củ không đúng");
                    return View(model);
                }
                return RedirectToAction("Restricted","Dashboard");

            }
            return View(model);
        }
        //
        // GET: /Administration/Partner/
        [EnsureSession]
        public ActionResult Index()
        {
            PartnerService service = new PartnerService();
            string status = EntityStates.Activated.ToString();
            PartnerIndexModel model = new PartnerIndexModel()
            {
                Partners = service.GetPaged(p => p.Status == status,
                    new IOrderByClause<Partner>[] { new OrderByClause<Partner, int>(p => p.PartnerID, SortDirection.Decending) },
                    1,
                    100)
            };
            return View(model);
        }

        //
        // GET: /Administration/Partner/Details/5

        public ActionResult Details(int id)
        {
            return View();
        }

        //
        // GET: /Administration/Partner/Create

         [Authorize]
         [EnsureSession]
        public ActionResult Create()
        {
            return View();
        } 

        //
        // POST: /Administration/Partner/Create

        [HttpPost]
        [Authorize]
        [EnsureSession]
         public ActionResult Create(CreatePartnerModel model, FormCollection collection, HttpPostedFileBase Logo)
        {
            try
            {
                if (ModelState.IsValid)
                {
                    Partner partner = new Partner()
                    {
                        Name = model.Name,
                        Address = model.Address,
                        ContactName = model.ContactName,
                        CreatedUserID = SessionManager.UserInfo.UserID,
                        UpdatedUserID = SessionManager.UserInfo.UserID,
                        Description = model.Description,
                        PartnerType = model.PartnerType,
                        PhoneNumber1 = model.PhoneNumber1,
                        PhoneNumber2 = model.PhoneNumber2,
                    };
                    PartnerService service = new PartnerService();
                    service.AddNew(partner, Logo);
                    return RedirectToAction("Index", "Partner");
                }
                else
                {
                    ModelState.AddModelError("Error", "Thông tin vừa nhập không hợp lệ , vui lòng kiểm tra lại");
                    return View(model);
                }
            }
            catch
            {
                ModelState.AddModelError("Error", "Có lỗi xãy ra.");
                return View(model);
            }
        }
        
        //
        // GET: /Administration/Partner/Edit/5
 
        [Authorize]
        [EnsureSession]
        public ActionResult Edit(int id)
        {
            PartnerService service = new PartnerService();
            var item = service.FirstOrDefault(p => p.PartnerID == id);
            
            if (item != null)
            {
                EditPartnerModel model = new EditPartnerModel()
                {
                    Id = id,
                    Address = item.Address,
                    ContactName = item.ContactName,
                    Description = item.Description,
                    LogoPath = item.LogoPath,
                    Name = item.Name,
                    PartnerType = item.PartnerType,
                    PhoneNumber1 = item.PhoneNumber1,
                    PhoneNumber2 = item.PhoneNumber2
                };
                return View(model);
            }
            return View();
        }

        //
        // POST: /Administration/Partner/Edit/5

        [HttpPost]
        public ActionResult Edit(EditPartnerModel model, int id, HttpPostedFileBase Logo)
        {
            try
            {
                if (ModelState.IsValid)
                {
                    Partner partner = new Partner()
                    {
                        PartnerID = id,
                        Name = model.Name,
                        Address = model.Address,
                        ContactName = model.ContactName,
                        
                        UpdatedUserID = SessionManager.UserInfo.UserID,
                        Description = model.Description,
                        PartnerType = model.PartnerType,
                        PhoneNumber1 = model.PhoneNumber1,
                        PhoneNumber2 = model.PhoneNumber2,
                        LogoPath = model.LogoPath,
                    };
                    PartnerService service = new PartnerService();
                    service.Edit(partner, Logo);
                    return RedirectToAction("Index", "Partner");
                }
                // TODO: Add update logic here
 
               
            }
            catch (Exception ex)
            {
                ModelState.AddModelError("Error500", ex.Message);
            }
            return View(model);
        }

        //
        // GET: /Administration/Partner/Delete/5

        [EnsureSession]
        [HasRights(Permissions.Full)]
        public ActionResult Delete(int id)
        {
            PartnerService service = new PartnerService();
            service.Delete(id);

            return RedirectToAction("Index");
        }

        //
        // POST: /Administration/Partner/Delete/5

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
