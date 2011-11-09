using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using PagedList;
using GMR.Repository;
using System.ComponentModel.DataAnnotations;

namespace GMR.App.Areas.Administration.Models
{
    public class CreatePartnerModel
    {
        [Required(ErrorMessage="*")]
        [Display(Name="Tên đối tác:")]
        public string Name { get; set; }
        [Required(ErrorMessage = "*")]
        [Display(Name="Địa chỉ:")]
        public string Address { get; set; }
        [Required(ErrorMessage = "*")]
        [Display(Name="Người liên hệ:")]
        public string ContactName { get; set; }
        [Required(ErrorMessage = "*")]
        [Display(Name = "Điện thoại:")]
        public string PhoneNumber1 { get; set; }
        [Required(ErrorMessage = "*")]
        [Display(Name = "Loại đối tác:")]
        public string PartnerType { get; set; }
        public int Status { get; set; }
        public string PhoneNumber2 { get; set; }
        public string Description { get; set; }
        public string LogoPath { get; set; }

    }
    public class EditPartnerModel : CreatePartnerModel
    {
        public int Id { get; set; }

    }
    public class PartnerIndexModel
    {
        public PagedList<Partner> Partners { get; set; }
        public PartnerIndexModel()
        {
            

        }
    }
}