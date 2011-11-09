using System.Web.Mvc;

namespace GMR.App.Areas.Administration
{
    public class AdministrationAreaRegistration : AreaRegistration
    {
        public override string AreaName
        {
            get
            {
                return "Administration";
            }
        }

        public override void RegisterArea(AreaRegistrationContext context)
        {
            context.MapRoute(
                "Administration_default",
                "Administration/{controller}.gmr/{action}/{id}",
                new { action = "Index", id = UrlParameter.Optional }
            );
        }
    }
}
