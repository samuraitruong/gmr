using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using System.Web.Security;
using GMR.App.Models;
using System.Web.Routing;

namespace GMR.App.Controllers.Attributes
{
    /// <summary>
    /// Checks the User's role using FormsAuthentication
    /// and throws and UnauthorizedAccessException if not authorized
    /// </summary>
    public class IgnorePartnerAttribute : ActionFilterAttribute
    {
        public override void OnActionExecuting(ActionExecutingContext filterContext)
        {
                if (!filterContext.HttpContext.User.Identity.IsAuthenticated)
                {


                }
                else
                {
                    bool isPartner = filterContext.HttpContext.User.IsInRole(BuiltinRoles.Partner.ToString());
                    if (isPartner)
                    {
                        //filterContext.Result = new RedirectToRouteResult(new RouteValueDictionary()
                        //{
                        //    { "controller", "Dashboard" },
                        //    { "action", "Restricted" },
                           
                        //});

                        var urlHelper = new UrlHelper(filterContext.RequestContext);
                        filterContext.HttpContext.Response.Redirect(urlHelper.RouteUrl(new{controller="Dashboard", action="Restricted"}));
                    }
                }
            
        }
    }
}