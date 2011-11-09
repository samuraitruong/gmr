using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using System.Web.Security;

namespace GMR.App.Controllers.Attributes
{
    /// <summary>
    /// Checks the User's role using FormsAuthentication
    /// and throws and UnauthorizedAccessException if not authorized
    /// </summary>
    public class RequiresRoleAttribute : ActionFilterAttribute
    {

        public string RoleToCheckFor { get; set; }

        public override void OnActionExecuting(ActionExecutingContext filterContext)
        {
            //redirect if the user is not authenticated
            if (!String.IsNullOrEmpty(RoleToCheckFor))
            {

                if (!filterContext.HttpContext.User.Identity.IsAuthenticated)
                {

                    //use the current url for the redirect
                    string redirectOnSuccess = filterContext.HttpContext.Request.Url.AbsolutePath;

                    //send them off to the login page
                    string redirectUrl = string.Format("?ReturnUrl={0}", redirectOnSuccess);
                    string loginUrl = FormsAuthentication.LoginUrl + redirectUrl;
                    filterContext.HttpContext.Response.Redirect(loginUrl, true);

                }
                else
                {
                    bool isAuthorized = filterContext.HttpContext.User.IsInRole(this.RoleToCheckFor);
                    if (!isAuthorized)
                        throw new UnauthorizedAccessException("You are not authorized to view this page");
                }
            }
            else
            {
                throw new InvalidOperationException("No Role Specified");
            }
        }
    }
}