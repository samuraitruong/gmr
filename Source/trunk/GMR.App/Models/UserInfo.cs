using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using GMR.Biz.Models;

namespace GMR.App.Models
{
    public class PermissionInfo
    {
        public string Module { get; set; }
        public string[] Actions { get; set; }
        public List<Permissions> Permissions { get; set; }
    }
    public class UserInfo
    {
        public string FullName { get; set; }
        public int UserID { get; set; }
        public string Roles { get; set; }
        public int PartnerId { get; set; }
        public List<PermissionInfo> Permissions { get; set; }
        public bool IsSystemAdministrator { get; set; }
    }
}