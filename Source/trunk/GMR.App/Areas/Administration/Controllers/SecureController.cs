using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using GMR.App.Areas.Administration.Models;
using System.Web.Security;
using GMR.App.Models;
using GMR.Biz;
using GMR.App.Utilities;

namespace GMR.App.Areas.Administration.Controllers
{
    public class SecureController : GMRBaseController
    {
        //
        // GET: /Administration/Secure/

        public ActionResult Index()
        {
            return View();
        }
        public ActionResult Login()
        {
            return View();
        }
        public ActionResult AccessDenied()
        {
            return View();
        }
        public ActionResult Logout(string returnUrl)
        {
            FormsAuthentication.SignOut();
            // clear authentication cookie
            HttpCookie cookie1 = new HttpCookie(FormsAuthentication.FormsCookieName, "");
            cookie1.Expires = DateTime.Now.AddYears(-1);
            Response.Cookies.Add(cookie1);

            // clear session cookie (not necessary for your current problem but i would recommend you do it anyway)
            HttpCookie cookie2 = new HttpCookie("ASP.NET_SessionId", "");
            cookie2.Expires = DateTime.Now.AddYears(-1);
            Response.Cookies.Add(cookie2);


            Response.Redirect(returnUrl);
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
                user.Roles,
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
        public ActionResult Index( LoginModel model)
        {
            if (ModelState.IsValid)
            {
                // Get user info
              
                var user = UserService.ValidateUser(model.Username, model.Password);

                if (user != null && user.UserID > 0)
                {
                    UserInfo info = UIHelper.BuildUserInfo(user);
                    persistUser(info, model.RememberMe);
                    
                    SessionManager.UserInfo = info;
                    if (!string.IsNullOrEmpty(Request["ReturnUrl"]) && !Request["ReturnUrl"].Contains("AccessDenied"))
                     
                    {
                        return Redirect(Request["ReturnUrl"]);
                    }
                    return RedirectToAction("Index", "Dashboard");
                }
                else
                {
                    ViewData["Message"] = string.Format(
                        "Invalid username/password combination. Please try again.");

                    return View(model);
                }
            }

            return View(model);
        }
        //
        // GET: /Administration/Secure/Details/5

        public ActionResult Details(int id)
        {
            return View();
        }

        //
        // GET: /Administration/Secure/Create

        public ActionResult Create()
        {
            return View();
        } 

        //
        // POST: /Administration/Secure/Create

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
        // GET: /Administration/Secure/Edit/5
 
        public ActionResult Edit(int id)
        {
            return View();
        }

        //
        // POST: /Administration/Secure/Edit/5

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
        // GET: /Administration/Secure/Delete/5
 
        public ActionResult Delete(int id)
        {
            return View();
        }

        //
        // POST: /Administration/Secure/Delete/5

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
