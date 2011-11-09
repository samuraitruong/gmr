using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using PagedList;
using GMR.Repository;

namespace GMR.App.Areas.Administration.Models
{
    public class SettingModel
    {
        public PagedList<Setting> Settings { get; set; }
    }
}