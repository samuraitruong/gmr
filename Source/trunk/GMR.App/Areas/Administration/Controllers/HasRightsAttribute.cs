using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using GMR.App.Models;
using GMR.Biz.Models;

namespace GMR.App.Areas.Administration.Controllers
{
    public class HasRightsAttribute : ActionFilterAttribute
    {
        public HasRightsAttribute()
        {
            //this.Right = p;
        }
        public HasRightsAttribute(Permissions p)
        {
            this.Right = p;
        }
        public Permissions Right { get; set; }
        public override void OnActionExecuting(ActionExecutingContext filterContext)
        {
            var context = filterContext.RequestContext;
            var controller = context.RouteData.Values["controller"];
            var urlHelper = new UrlHelper(filterContext.RequestContext);

            if (!filterContext.HttpContext.User.Identity.IsAuthenticated || SessionManager.UserInfo == null)
            {
                filterContext.HttpContext.Response.Redirect(urlHelper.RouteUrl(new { controller = "Secure", action = "Index" }));

            }
            else
            {
                bool hasRight = false;
              
                if (SessionManager.UserInfo.IsSystemAdministrator) return ;
                if (Right == Permissions.SA && !SessionManager.UserInfo.IsSystemAdministrator)
                {
                }
                else
                {
                    foreach (var item in SessionManager.UserInfo.Permissions)
                    {
                        if (item.Actions.Contains(controller) && (item.Permissions.Contains(this.Right) || item.Permissions.Contains(Permissions.Full)))
                        {
                            hasRight = true;
                        }
                    }
                }
                if (!hasRight)
                {
                    filterContext.HttpContext.Response.Redirect(urlHelper.RouteUrl(new { controller = "Secure", action = "AccessDenied" }));
                }
            }
              
        }
    }
}