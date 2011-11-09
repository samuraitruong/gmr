using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using GMR.Repository;
using GMR.Common;
using GMR.Biz.Extensions;
using GMR.Common.Extensions;

namespace GMR.Biz
{
    public class CategoryService : GMRService<Category>
    {
        public void AddCategory(Category cat)
        {
            cat.StaticName = cat.CategoryName.ToUrlKey();
            Add(cat);
            UnitOfWork.Commit();
        }

        public Category GetByStaticName(string category)
        {
            return GetQuery().FirstOrDefault(o => o.StaticName == category);
        }

        public Category GetById(int id)
        {
            return FirstOrDefault(p => p.CategoryID == id);
        }

        public void Edit(int id, string categoryname, int? parent, string accesstypes)
        {
            var item = GetById(id);
            item.CategoryName = categoryname;
            if (parent.HasValue) item.ParentCategoryID = parent.Value;
            item.UpdatedDate = DateTime.Now;
            item.StaticName = item.CategoryName.ToUrlKey();
            item.AccessTypes = accesstypes;
            UnitOfWork.Commit();
        }
    }
}
