using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using GMR.App.Models;

namespace GMR.App.Controllers.Attributes
{
    public class EnsureSessionAttribute : ActionFilterAttribute
    {
        public override void OnActionExecuting(ActionExecutingContext filterContext)
        {
            if (SessionManager.UserInfo == null)
            {

                var urlHelper = new UrlHelper(filterContext.RequestContext);
                if (RedirectToClientLogin)
                {
                    filterContext.HttpContext.Response.Redirect(urlHelper.RouteUrl(new { controller = "Home", action = "ClientLogin", Area = "" }));
                }
                else
                {
                    filterContext.HttpContext.Response.Redirect(urlHelper.RouteUrl(new { controller = "Secure", action = "Index" }));
                }
            }
        }
        public string ReturnUrl { get; set; }
        public bool RedirectToClientLogin { get; set; }

    }

}