using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using GMR.App.Models;
using GMR.App.Areas.Administration.Models;

namespace GMR.App.Areas.Administration.Controllers
{
    
    public class GMRBaseController : Controller
    {
        protected override void Initialize(System.Web.Routing.RequestContext requestContext)
        {
            base.Initialize(requestContext);
            string controller = requestContext.RouteData.Values["controller"].ToString();
            string action = requestContext.RouteData.Values["action"].ToString();
            string area = "Administration";

            if (SessionManager.UserInfo!= null && SessionManager.UserInfo.PartnerId > 0)
            {
                controller = "Home";
                action="ClientLogin";
                area="";
            }
            this.ViewData.Add("LoginView", new LoginViewModel()
            {
                Fullname = SessionManager.UserInfo != null ? SessionManager.UserInfo.FullName : "",
                ServerTime = DateTime.Now.ToString("h:mm tt"),
                ClientIP = System.Web.HttpContext.Current.Request.UserHostAddress,
                Controller = controller,
               Action =action,
               Area = area
            });

            var item = ControllerContext.RouteData.Values["Controller"];
            string module = RouteData.Values.First().Value.ToString();
            this.ViewData.Add("Module", module);
        }
        //
        // GET: /Administration/GMRBase/

        public GMRBaseController() : base(){
            
        }  

    }
}
