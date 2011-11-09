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
using GMR.Common.Extensions;
using GMR.App.Controllers.Attributes;
using GMR.Common;
using GMR.Biz.Models;

namespace GMR.App.Areas.Administration.Controllers
{
    public class UserController : GMRBaseController
    {
        //
        // GET: /Administration/User/
        [Authorize]
        [EnsureSession]
        [HasRights(Right = Permissions.Read)]
        public ActionResult Index()
        {
            UserService service = new UserService();

            UserIndexModel model = new UserIndexModel()
            {
                Users = service.GetPaged(p => p.UserID > 0, new IOrderByClause<User>[] { new OrderByClause<User, int>(p=>p.UserID, SortDirection.Ascending) },
               1,100)
            };
            return View(model);
        }

        //
        // GET: /Administration/User/Details/5

        [Authorize]
        [EnsureSession]
        public ActionResult Details(int id)
        {
            return View();
        }

        //
        // GET: /Administration/User/Create

        [HasRights(Right = Permissions.Create)]
        [Authorize]

        public ActionResult Create()
        {
            return View();
        } 

        //
        // POST: /Administration/User/Create

        [HttpPost]
        [Authorize]
        [EnsureSession]
        [HasRights(Permissions.Create)]

        public ActionResult Create(UserCreateModel model)
        {
            try
            {
                if (ModelState.IsValid)
                {
                    User i = new User()
                    {
                        UserName = model.Username,
                        Password = model.Password,
                        Email = model.Email,
                        Description = model.Description,
                        FullName = model.Fullname,
                        Occupation = model.Occupation,
                        Address = model.Address,
                        Industry = model.Industry,
                        AnualIcome = model.AnualIncome,
                        BirthYear = model.BirthYear,
                        UserTypeID = model.UserTypeId,
                        PhoneNumber1 = model.Phone1,
                        PhoneNumber2 = model.Phone2,
                        PhoneNumber3 = model.Phone3,
                        CreatedUserID = SessionManager.UserInfo.UserID,
                        UpdatedUserID = SessionManager.UserInfo.UserID,
                        GroupID = model.GroupID,
                    };
                    if (model.PartnerId > .0)
                    {
                        i.PartnerId = model.PartnerId;
                    }
                    UserService.AddUser(i);
                    return RedirectToAction("Index");
                }
                
            }
            catch (Exception ex)
            {
                ModelState.AddModelError("Error_500","Đã có lỗi hệ thống xãy ra, không thể cập nhật được dữ liệu");
                Logger.Log(ex);
               
            }
            return View(model);
        }
        
        //
        // GET: /Administration/User/Edit/5
        [Authorize]
        [EnsureSession]
        [HasRights(Permissions.Edit)]
        public ActionResult Edit(int id)
        {
            UserService service = new UserService();
            User user = service.GetById(id);
            
            EditUserModel model = new EditUserModel();
            
            model.CopyPropertiesFrom(user);
            model.Phone1 = user.PhoneNumber1;
            model.Phone2 = user.PhoneNumber2;
            model.Phone3 = user.PhoneNumber3;
            model.Username = user.UserName;
            model.Password = string.Empty;
            model.Fullname = user.FullName;
            
            return View(model);
        }

        //
        // POST: /Administration/User/Edit/5

        [HttpPost]
        [Authorize]
        [EnsureSession]
        [HasRights(Permissions.Edit)]
        public ActionResult Edit(int id, EditUserModel model)
        {
            try
            {

                if (ModelState.IsValid)
                {
                    User user = new User()
                    {
                        UserID = model.UserID,
                        UserName = model.Username,
                        Password = model.Password,
                        Email = model.Email,
                        Description = model.Description,
                        FullName = model.Fullname,
                        Occupation = model.Occupation,
                        Address = model.Address,
                        Industry = model.Industry,
                        AnualIcome = model.AnualIncome,
                        BirthYear = model.BirthYear,
                        UserTypeID = model.UserTypeId,
                        PhoneNumber1 = model.Phone1,
                        PhoneNumber2 = model.Phone2,
                        PhoneNumber3 = model.Phone3,
                        //CreatedUserID = SessionManager.UserInfo.UserID,
                        UpdatedUserID = SessionManager.UserInfo.UserID,
                        GroupID = model.GroupID,
                    };
                    if (model.PartnerId > .0)
                    {
                        user.PartnerId = model.PartnerId;
                    }
                    UserService service = new UserService();
                    service.Update(user);
                    return RedirectToAction("Index");
                }
                // TODO: Add update logic here
 
                
            }
            catch (Exception ex)
            {
                Logger.Log(ex);
                ModelState.AddModelError("Error500", ex.Message);
            }
            return View(model);
        }

        //
        // GET: /Administration/User/Delete/5
 
        public ActionResult Delete(int id)
        {
            return View();
        }

        //
        // POST: /Administration/User/Delete/5

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
