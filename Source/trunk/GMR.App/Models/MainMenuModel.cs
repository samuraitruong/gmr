using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using PagedList;
using GMR.Repository;

namespace GMR.App.Models
{
    public class MainMenuModel
    {
        public PagedList<Category> Categories { get; set; }

    }
}