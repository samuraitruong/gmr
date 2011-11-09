using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using GMR.App.Areas.Administration.Models;
using GMR.Repository;
using GMR.Biz;
using GMR.App.Controllers.Attributes;
using GMR.Biz.Models;

namespace GMR.App.Areas.Administration.Controllers
{
    public class SettingController : GMRBaseController
    {
        //
        // GET: /Administration/Setting/
        [Authorize]
        [EnsureSession]
        [HasRights(Permissions.SA)]
        public ActionResult Index()
        {
            GMRService<Setting> svr = new GMRService<Setting>();
            SettingModel model = new SettingModel(){
            Settings = svr.GetPaged(p=>p.SettingID>0,
            new Common.EF.IOrderByClause<Setting>[] {new Common.EF.OrderByClause<Setting, int>(p=>p.SettingID, Common.EF.SortDirection.Ascending)}
            ,1,100)
            };

            return View(model);
        }

        [Authorize]
        [EnsureSession]
        [HttpPost]
        [HasRights(Permissions.SA)]
        public ActionResult Index(FormCollection formcollection) {
            SettingService service = new SettingService();

            for (int i = 0; i < formcollection.Count; i++ )
                {
                    string key = formcollection.AllKeys[i];

                    string value = formcollection[i];
                    service.Update(key, value);
                }
            return RedirectToAction("Index");
        }
          
    }
}
