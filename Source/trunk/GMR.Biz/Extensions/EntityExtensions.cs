using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Text.RegularExpressions;
using GMR.Common.Extensions;
using GMR.Configuration;
using GMR.Repository;
using GMR.Biz.Models;

namespace GMR.Biz.Extensions
{
    public static class EntityExtensions
    {
  
        public static string ToUrlKey(this string key)
        {
            Regex regex = new Regex(GMRConfigurationManager.WebUI.RemoveRule);
            return regex.Replace(key.DoStripDiacritics(), GMRConfigurationManager.WebUI.ReplacementChar);
        }
        public static string GetUrlKey(this News item)
        {
            string key = item.Subject;

            Regex regex = new Regex(GMRConfigurationManager.WebUI.RemoveRule);
            return regex.Replace(key.DoStripDiacritics(), GMRConfigurationManager.WebUI.ReplacementChar);
        }
        public static bool IsSA(this User user)
        {
            GMRService<Module> modulesvr = new GMRService<Module>();
            var SAModule = modulesvr.FirstOrDefault(p => p.Keys == "SA");
            if (SAModule == null) return false;
            var permission = user.Permissions.Where(p => p.ModuleID == SAModule.ModuleID).FirstOrDefault();
            return permission != null;
        }


        public static List<News> GetLastestNew(this Category item)
        {
            return item.News.OrderByDescending(p => p.UpdateDate).Take(GMRSetting.LastestNewsDisplayed).ToList();
        }
    }
}
