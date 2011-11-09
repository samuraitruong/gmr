using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using GMR.Repository;
using GMR.Common;
using GMR.Biz.Models;
namespace GMR.Biz
{
    public class SettingService : GMRService<Setting>
    {

       public Setting GetSetting(GMRSetting.SettingKeys key)
        {
            string skey = key.ToString();
            var item = FirstOrDefault(p => p.Key == skey);
           if (item == null)
           {
               item = new Setting() { 
               Key = key.ToString(),
               Value = "DEFAULT"
               
               };
               Add(item);
           }
           return item;

        }

       public void Update(string key, string value)
       {
           var item = FirstOrDefault(p => p.Key == key);
           if (item == null) return;
           item.Value = value;
           UnitOfWork.Commit();
       }
    }
}
