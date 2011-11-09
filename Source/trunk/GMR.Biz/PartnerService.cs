using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using GMR.Repository;
using GMR.Common;
using GMR.Biz.Helpers;
using GMR.Biz.Models;
using System.Reflection;
using System.Data.Objects.DataClasses;
using GMR.Common.Extensions;

namespace GMR.Biz
{
    public class PartnerService : GMRService<Partner>
    {
        public void AddNew(Partner partner, global::System.Web.HttpPostedFileBase logo)
        {
            partner.CreatedDate = DateTime.Now;
            partner.UpdatedDate = DateTime.Now;
            partner.Status = EntityStates.Activated.ToString();
            if (logo != null && logo.ContentLength > 0)
            {
                string filename = FileUploader.UploadImage(GMRSetting.LogoPath, logo.InputStream, logo.FileName);
                partner.LogoPath = filename;
            }
            Add(partner);
            //TODO :Save logo
        }

        public void Edit(Partner partner, System.Web.HttpPostedFileBase logo)
        {
            
            partner.UpdatedDate = DateTime.Now;
            
            if (logo != null && logo.ContentLength > 0)
            {
                if (string.IsNullOrEmpty(partner.LogoPath))
                {
                    string filename = FileUploader.UploadImage(GMRSetting.LogoPath, logo.InputStream, logo.FileName, false);

                    partner.LogoPath = filename;
                }
                else
                {
                    FileUploader.UploadImage(GMRSetting.LogoPath, logo.InputStream, partner.LogoPath, true);
                }
                
            }
            var item = FirstOrDefault(p=>p.PartnerID == partner.PartnerID);
            item.CopyPropertiesFrom(partner, "Status", "CreatedUserID");

            item.Status = EntityStates.Activated.ToString();

            UnitOfWork.Commit();
        }


        public void Delete(int id)
        {
            var item = FirstOrDefault(p => p.PartnerID == id);
            item.Status = EntityStates.Deleted.ToString();
            UnitOfWork.Commit();
        }
    }
}
