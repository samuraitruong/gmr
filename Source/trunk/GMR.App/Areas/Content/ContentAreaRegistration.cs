using System.Web.Mvc;
using System;

namespace GMR.App.Areas.Content
{
    public class ContentAreaRegistration : AreaRegistration
    {
        public override string AreaName
        {
            get
            {
                return "Content";
            }
        }

        public override void RegisterArea(AreaRegistrationContext context)
        {
            context.MapRoute(
               "Category-View-Route",
               "{date}/{category}_{page}.gmr",

               new
               {
                   controller = "Content",
                   action = "ViewCategory",
                   area = "Content",
                   page = 1,
                   date = DateTime.Now.ToString("dd-MM-yyyy")
               });

            context.MapRoute(
              "News-View-Route",
              "{date}/{category}/{news}.gmr",

              new
              {
                  controller = "Content",
                  action = "ViewNews",
                  area = "Content",
                  date = DateTime.Now.ToString("dd-MM-yyyy")
              });

            context.MapRoute(
                "Content_default",
                "Content/{controller}/{action}/{id}",
                new { action = "Index", id = UrlParameter.Optional,  }
            );
        }
    }
}
