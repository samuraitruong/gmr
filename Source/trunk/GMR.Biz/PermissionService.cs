using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using GMR.Repository;
using GMR.Common;
using GMR.Biz.Models;
using GMR.Common.Extensions;
namespace GMR.Biz
{
    public class PermissionService : GMRService<Permission>
    {

        public bool EnsurePermssionForGroup(int groupId, int moduleId, Permissions permission, bool grant)
        {
            var item = FirstOrDefault(p => p.GroupID == groupId && p.ModuleID == moduleId);
            if (item == null)
            {
                item = new Permission()
                {
                    GroupID = groupId,
                    ModuleID = moduleId,
                    UpdatedDate = DateTime.Now,
                    CreatedDate= DateTime.Now,
                    
                };
                item = Add(item);


            }

            item.SetProperty(permission.ToString(), grant);
            UnitOfWork.Commit();

            return true;
        }

        public bool EnsurePermssionForUser(int userId, int moduleId, Permissions permission, bool grant)
        {
            var item = FirstOrDefault(p => p.UserID == userId && p.ModuleID == moduleId);
            if (item == null)
            {
                item = new Permission()
                {
                    UserID = userId,
                    ModuleID = moduleId,
                    UpdatedDate = DateTime.Now,
                    CreatedDate = DateTime.Now,

                };
                item = Add(item);


            }

            item.SetProperty(permission.ToString(), grant);
            UnitOfWork.Commit();

            return true;
        }

        public void AddSA(int id, bool grant)
        {
            throw new NotImplementedException();
        }

        public void GrantSA(int id, bool grant, int uid)
        {
            GMRService<Module> modulesvr = new GMRService<Module>();
            var SAModule = modulesvr.FirstOrDefault(p => p.Keys == "SA");

            var item = FirstOrDefault(p => p.UserID == id && p.ModuleID == SAModule.ModuleID);
            if (item == null && grant == true)
            {
                Permission permission = new Permission()
                {
                    ModuleID = SAModule.ModuleID,
                    UserID = id,
                    UpdatedDate = DateTime.Now,
                    CreatedDate = DateTime.Now,
                };
                Add(permission);
            }
            else
            {
                if (item != null && grant == false)
                {
                    Delete(item);
                }
            }
            UnitOfWork.Commit();
        }
    }
}
