using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using GMR.App.Models;
using GMR.Repository;
using GMR.Biz;
using GMR.Common.EF;
using PagedList;
using System.Web.Mvc;
using GMR.Biz.Models;
using GMR.Biz.Extensions;


namespace GMR.App.Utilities
{
    public class UIHelper
    {
        public static UserInfo BuildUserInfo(User u)
        {
            var info = new UserInfo()
            {
                PartnerId = u.PartnerId.HasValue ? u.PartnerId.Value : -1,
                UserID = u.UserID,
                FullName = u.FullName,
                Roles = u.UserType.UserTypeName,
                Permissions = new List<PermissionInfo>(),
                IsSystemAdministrator = u.IsSA(),
            };

            List<Permission> permissions = new List<Permission>();
            permissions.AddRange(u.Permissions.ToList());
            if(u.Group!= null) permissions.AddRange(u.Group.Permissions);

            var grouped = permissions.GroupBy(p => p.Module);
            var distinctPermissions = new List<PermissionInfo>();
            foreach (var items in grouped)
            {
                
                PermissionInfo pi = new PermissionInfo()
                {
                    Module = items.Key.Name,
                    Actions = items.Key.Keys.Split(";".ToCharArray()),
                    Permissions = new  List<Permissions>()
                };
                foreach (var item in items)
                {
                    EnsurePermission(pi.Permissions, Permissions.Full, item.Full);
                    EnsurePermission(pi.Permissions, Permissions.Create, item.Create);
                    EnsurePermission(pi.Permissions, Permissions.Edit, item.Edit);
                    EnsurePermission(pi.Permissions, Permissions.Read, item.Read);
                }
                info.Permissions.Add(pi);
	        }
            
            return info;
        }

        private static void EnsurePermission(List<Permissions> list, Permissions permissions, bool? nullable)
        {
            if (nullable == null) return;

            if (nullable == true && !list.Contains(permissions))
            {
                list.Add(permissions);
            }

        }

        public static IEnumerable<SelectListItem> SymbolNames
        {
            get
            {

                SymbolTypeService service = new SymbolTypeService();
                PagedList<SymbolType> paged = service.GetPaged(p => p.ID > 0,
                    new IOrderByClause<SymbolType>[] { new OrderByClause<SymbolType, int>(p => p.Order, SortDirection.Ascending) },
                    1,
                    100);
                var query = paged.Select(p => new SelectListItem()
                {
                    Text = p.DisplayName,
                    Value = p.ID.ToString()
                });

                return query;
            }
        }

        public static IEnumerable<SelectListItem> UserGroups
        {
            get
            {

                GMRService<Group> service = new GMRService<Group>();
                PagedList<Group> paged = service.GetPaged(p => p.GroupID > 0,
                    new IOrderByClause<Group>[] { new OrderByClause<Group, string>(p => p.GroupName, SortDirection.Ascending) },
                    1,
                    100);
                var query = paged.Select(p => new SelectListItem()
                {
                    Text = p.GroupName,
                    Value = p.GroupID.ToString()
                });

                return query;
            }
        }

        public static IEnumerable<SelectListItem> Districts
        {
            get
            {
                DistrictService service = new DistrictService();
                PagedList<District> paged = service.GetPaged(p => p.ID > 0,
                    new IOrderByClause<District>[] { new OrderByClause<District, int>(p => p.Order, SortDirection.Ascending) },
                    1,
                    100);
                var query = paged.Select(p => new SelectListItem()
                {
                    Text = p.DisplayName,
                    Value = p.ID.ToString()
                });

                return query;
            }
        }

        public static IEnumerable<SelectListItem> Partners
        {
            get
            {
                PartnerService service = new PartnerService();

                PagedList<Partner> paged = service.GetPaged(p => p.PartnerID > 0,
                   new IOrderByClause<Partner>[] { new OrderByClause<Partner, string>(p => p.Name, SortDirection.Ascending) },
                   1,
                   100);
                var query = paged.Select(p => new SelectListItem()
                {
                    Text = p.Name,
                    Value = p.PartnerID.ToString()
                });
               List<SelectListItem> results =  query.ToList();
               results.Insert(0, new SelectListItem() { Text = "Chọn một đối tác", Value = "0" });
                return results.AsEnumerable();

            }
        }

        public static IEnumerable<SelectListItem> UserTypes
        {
            get
            {
                UserTypeService service = new UserTypeService();

                PagedList<UserType> paged = service.GetPaged(p => p.UserTypeID > 0,
                   new IOrderByClause<UserType>[] { new OrderByClause<UserType, string>(p => p.DisplayName, SortDirection.Ascending) },
                   1,
                   100);
                var query = paged.Select(p => new SelectListItem()
                {
                    Text = p.DisplayName,
                    Value = p.UserTypeID.ToString()
                });

                return query;

            }
        }

        public static IEnumerable<SelectListItem> NewsCategories {

            get
            {
                CategoryService service = new CategoryService();

                PagedList<Category> paged = service.GetPaged(p => p.CategoryID > 0,
                   new IOrderByClause<Category>[] { new OrderByClause<Category, string>(p => p.CategoryName, SortDirection.Ascending) },
                   1,
                   100);
                var query = paged.Select(p => new SelectListItem()
                {
                    Text = p.CategoryName,
                    Value = p.CategoryID.ToString()
                });
                var list = query.ToList();
                list.Insert(0, new SelectListItem() { Text = "Chọn một danh mục", Value = "" });
                return list.AsEnumerable();

            }
        }
    }
}