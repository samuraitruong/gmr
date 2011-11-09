using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using GMR.App.Models;

namespace GMR.App.Areas.Content.Controllers
{
    public class AllowAccessAttribute : ActionFilterAttribute
    {
        
        public override void OnActionExecuting(ActionExecutingContext filterContext)
        {
            var urlHelper = new UrlHelper(filterContext.RequestContext);
            string url = HttpContext.Current.Request.RawUrl;
            if (SessionManager.AccessInfo == null)
            {
                filterContext.HttpContext.Response.Redirect(urlHelper.RouteUrl(new { controller = "Content", action = "SMS", area = "Content", Source = url }));
            }           

        }
    }
}