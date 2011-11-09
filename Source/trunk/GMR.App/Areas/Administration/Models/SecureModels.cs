using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.ComponentModel.DataAnnotations;

namespace GMR.App.Areas.Administration.Models
{
    public class LoginModel
    {
        [Required(ErrorMessage = "*")]
        [Display(Name = "Ten Dang Nhap")]
        public string Username { get; set; }
        [Required(ErrorMessage = "*")]
        [DataType (DataType.Password)]
        [Display(Name = "Mat Khau")]
        public string Password { get; set; }
        public bool RememberMe {get;set; }
    }
    public class AccessDeniedModel
    {

    }
}