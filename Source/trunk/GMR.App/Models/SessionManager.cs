using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace GMR.App.Models
{
    public class SessionManager
    {
        public static bool SMSVerified
        {
            get
            {
                if (HttpContext.Current.Session["SMSVerified"] != null)
                    return Convert.ToBoolean(HttpContext.Current.Session["SMSVerified"]);
                return false;
            }

            set
            {

                HttpContext.Current.Session["SMSVerified"] = value;
            }
        }
        public static UserInfo UserInfo
        {
            get
            {
                return HttpContext.Current.Session["UserInfo"] as UserInfo;
            }

            set
            {

                HttpContext.Current.Session["UserInfo"] = value;
            }
        }

        public static AccessInfo AccessInfo
        {
            get
            {
                return HttpContext.Current.Session["AccessInfo"] as AccessInfo;
            }

            set
            {

                HttpContext.Current.Session["AccessInfo"] = value;
            }
        }
    }
}