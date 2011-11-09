using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace GMR.App.Areas.Administration.Models
{
    public class LoginViewModel
    {
        public string Fullname { get; set; }
        public string ServerTime { get; set; }
        public string ClientIP { get; set; }
        public string Controller { get; set; }
        public string Action { get; set; }
        public string Area { get; set; }
    }
}