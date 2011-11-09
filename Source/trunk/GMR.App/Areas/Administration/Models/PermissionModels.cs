using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using PagedList;
using GMR.Repository;

namespace GMR.App.Areas.Administration.Models
{
    public class IndexPermissionModel
    {
        public  PagedList<Group> Groups{ get; set; }
        public PagedList<Permission> Permissions { get; set; }
    }
    public class ViewGroupPermissionModel{
        public int GroupId { get; set; }
        public string Name { get; set; }
        public PagedList<Module> Modules { get; set; }
    }
    public class EditGroupPermissionModel
    {
        public int GroupId { get; set; }
        public string Name { get; set; }
        public PagedList<Module> Modules { get; set; }
        public PagedList <Permission> Permission { get; set; }
    }
    public class EditUserPermissionModel {
        public int? GroupId { get; set; }
        public string Name { get; set; }
        public PagedList<Module> Modules { get; set; }
        public PagedList<Permission> Permission { get; set; }
        public User  User { get; set; }
    }
}