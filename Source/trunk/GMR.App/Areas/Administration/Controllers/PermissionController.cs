using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using GMR.App.Areas.Administration.Models;
using GMR.Biz;
using GMR.Repository;
using GMR.Common.EF;
using GMR.Biz.Models;
using GMR.App.Controllers.Attributes;
using GMR.App.Models;

namespace GMR.App.Areas.Administration.Controllers
{
    public class PermissionController : GMRBaseController
    {
        //
        // GET: /Administration/Permission/
        [HasRights(Permissions.Read)]
        public ActionResult Index()
        {
            GMRService<Group> servie = new GMRService<Group>();
            PermissionService pservice = new PermissionService();
            IndexPermissionModel model = new IndexPermissionModel()
            {
                Groups = servie.GetPaged(p => p.GroupID > 0, new Common.EF.IOrderByClause<Group>[] { new OrderByClause<Group, string>(p => p.GroupName, SortDirection.Ascending) }, 1, 100),
                Permissions = pservice.GetPaged(p => p.PermissionID > 0, new Common.EF.IOrderByClause<Permission>[] { new OrderByClause<Permission, DateTime>(p => p.UpdatedDate.Value, SortDirection.Decending) }, 1, 100)
            };

            return View(model);
        }

        //
        // GET: /Administration/Permission/Details/5
        
        public ActionResult Details(int id)
        {
            return View();
        }

        [HttpPost]
        [HasRights(Permissions.Edit)]
        [EnsureSession]
        [Authorize]
        public ActionResult GroupEdit(int id, string module, bool grant)
        {
            string [] str = module.Split("_".ToCharArray());

            int moduleId = Convert.ToInt32(str[1]);
            Permissions permisson =(Permissions) Enum.Parse(typeof(Permissions), str[0]);
            PermissionService servie = new PermissionService();

            bool value = servie.EnsurePermssionForGroup(id,moduleId, permisson, grant);
            return Json(true, JsonRequestBehavior.AllowGet);
        }
        [HasRights(Permissions.Edit)]
        [EnsureSession]
        public ActionResult GroupEdit(int id)
        {
            GMRService<Module> service = new GMRService<Module>();
            GMRService<Group> groupService = new GMRService<Group>();
            EditGroupPermissionModel model = new EditGroupPermissionModel()
            {
                GroupId = id,
                Name = groupService.FirstOrDefault(p=>p.GroupID == id).GroupName,
                Modules = service.GetPaged(p => p.Keys!= "SA", new IOrderByClause<Module>[] { new OrderByClause<Module, string>(p => p.Name, SortDirection.Ascending) }, 1, int.MaxValue)
            };

            return View(model);
        }

        //
        // GET: /Administration/Permission/Create

        public ActionResult Create()
        {
            return View();
        } 
         [EnsureSession]
         [HasRights(Permissions.Edit)]
        [HttpPost]
        public ActionResult UserEdit(int id, string module, bool grant)
        {
            PermissionService servie = new PermissionService();
            if (module == "SA")
            {
                servie.GrantSA(id, grant, SessionManager.UserInfo.UserID);
                return Json(true, JsonRequestBehavior.AllowGet);
            }
            
            string[] str = module.Split("_".ToCharArray());

            int moduleId = Convert.ToInt32(str[1]);
            Permissions permisson = (Permissions)Enum.Parse(typeof(Permissions), str[0]);
            

            bool value = servie.EnsurePermssionForUser(id, moduleId, permisson, grant);
            return Json(true, JsonRequestBehavior.AllowGet);
        }
         [EnsureSession]
         [HasRights(Permissions.Edit)]
         public ActionResult UserView(int id)
         {
             UserService service = new UserService();
             var user = service.GetById(id);

             GMRService<Module> moduleSvc = new GMRService<Module>();


             EditUserPermissionModel model = new EditUserPermissionModel()
             {
                 User = user,
                 GroupId = user.GroupID.HasValue ? user.GroupID.Value : 0,
                 Name = user.Group != null ? user.Group.GroupName : string.Empty,
                 Modules = moduleSvc.GetPaged(p => p.Keys != "SA", new IOrderByClause<Module>[] { new OrderByClause<Module, string>(p => p.Name, SortDirection.Ascending) }, 1, int.MaxValue)


             };
             return View(model);
         }

        [EnsureSession]
        [HasRights(Permissions.Edit)]
        public ActionResult UserEdit(int id)
        {
            UserService service = new UserService();
            var user = service.GetById(id);

            GMRService<Module> moduleSvc = new GMRService<Module>();
         

            EditUserPermissionModel model = new EditUserPermissionModel()
            {
                User = user,
                GroupId = user.GroupID.HasValue?user.GroupID.Value: 0,
                Name = user.Group != null ? user.Group.GroupName : string.Empty,
                Modules = moduleSvc.GetPaged(p => p.Keys!="SA", new IOrderByClause<Module>[] { new OrderByClause<Module, string>(p => p.Name, SortDirection.Ascending) }, 1, int.MaxValue)


            };
            return View(model);
        }
        [EnsureSession]
        [HasRights(Permissions.Read)]
        public ActionResult GroupView(int id)
        {
            GroupService service = new GroupService();
            var group = service.GetById(id);

            GMRService<Module> moduleSvc = new GMRService<Module>();

            ViewGroupPermissionModel model = new ViewGroupPermissionModel()
            {
                
                GroupId = id,
                Name = group.GroupName,
                Modules = moduleSvc.GetPaged(p => p.Keys != "SA", new IOrderByClause<Module>[] { new OrderByClause<Module, string>(p => p.Name, SortDirection.Ascending) }, 1, int.MaxValue)


            };

            return View(model);
        }
        //
        // POST: /Administration/Permission/Create

        [HttpPost]
        public ActionResult Create(FormCollection collection)
        {
            try
            {
                // TODO: Add insert logic here

                return RedirectToAction("Index");
            }
            catch
            {
                return View();
            }
        }
        
        //
        // GET: /Administration/Permission/Edit/5
 
        public ActionResult Edit(int id)
        {
            return View();
        }

        //
        // POST: /Administration/Permission/Edit/5

        [HttpPost]
        public ActionResult Edit(int id, FormCollection collection)
        {
            try
            {
                // TODO: Add update logic here
 
                return RedirectToAction("Index");
            }
            catch
            {
                return View();
            }
        }

        //
        // GET: /Administration/Permission/Delete/5
 
        public ActionResult Delete(int id)
        {
            return View();
        }

        //
        // POST: /Administration/Permission/Delete/5

        [HttpPost]
        public ActionResult Delete(int id, FormCollection collection)
        {
            try
            {
                // TODO: Add delete logic here
 
                return RedirectToAction("Index");
            }
            catch
            {
                return View();
            }
        }
    }
}
