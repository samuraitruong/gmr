using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using PagedList;
using GMR.Repository;
using System.Web.Mvc;
using System.ComponentModel.DataAnnotations;

namespace GMR.App.Areas.Administration.Models
{
    public class IndexCategoryModel
    {
        public PagedList<Category> Categories{ get; set; }

    }

    public class EditCategoryModel
    {
        public int Id { get; set; }
        [Required(ErrorMessage = "*")]
        [Display(Name="Tên danh mục:")]
        public string Name { get; set; }
        [Display(Name = "Danh mục cha:")]
        public int? ParentCategoryID { get; set; }
         [Display(Name = "Loại truy cập:")]
        public string AccessTypes { get; set; }
    }
    public class CreateCategoryModel
    {
        [Required(ErrorMessage = "*")]
        [Display(Name="Tên danh mục:")]
        public string Name { get; set; }
        [Display(Name = "Danh mục cha:")]
        public int? ParentCategoryID { get; set; }

        [Display(Name = "Loại truy cập:")]
        public string AccessTypes { get; set; }
    }

    //public class MyAccountModel
    //{
    //    public User UserInfo { get; set; }
    //    [Required(ErrorMessage = "*")]
    //    [MinLength(4, ErrorMessage = "Mật khẩu không được ít hơn 6 kí tự")]
    //    [Display(Name = "Mật khẩu mới:")]
    //    public string Password { get; set; }
    //    [Compare("Password", ErrorMessage = "Mật khẩu không khớp")]
    //    [MinLength(4, ErrorMessage = "Mật khẩu không được ít hơn 6 kí tự")]
    //    [Required(ErrorMessage = "*")]
    //    [Display(Name = "Xác nhận mật khẩu:")]
    //    public string ConfirmPassword { get; set; }
    //    [Required(ErrorMessage = "*")]
    //    [Display(Name = "Mật khẩu cũ:")]
    //    public string OldPassword { get; set; }
    //}
}