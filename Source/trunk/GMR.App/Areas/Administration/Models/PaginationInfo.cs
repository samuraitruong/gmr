using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace GMR.App.Areas.Administration.Models
{
    public class PaginationInfo
    {
        public string Controller { get; set; }
        public string Action { get; set; }
        public string Area { get; set; }
    }
}