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
    public class UserIndexModel
    {
        public PagedList<User> Users { get; set; }

    }
    [UniqueUserEmail("UserID", "Email", ErrorMessage="Email đã đắng kí cho người dùng khác")]
    public class EditUserModel 
    {
        public int UserID { get; set; }
        [Required(ErrorMessage = "*")]
        [MinLength(4, ErrorMessage = "Tên đăng nhập không được ít hơn 4 kí tự")]
        [Display(Name = "Tên đăng nhập:")]
        public string Username { get; set; }

        [Display(Name = "Mật khẩu:")]
       //[Required(ErrorMessage = "*")]
        //[MinLength(4, ErrorMessage = "Mật khẩu không được ít hơn 6 kí tự")]
        public string Password { get; set; }

        [Display(Name = "Xác nhận mật khẩu:")]
        [Compare("Password", ErrorMessage = "Password doesn't match")]
        //[Required(ErrorMessage = "*")]
        public string ConfirmPassword { get; set; }

        [Required(ErrorMessage = "*")]
        [MinLength(7, ErrorMessage = "Số điện thoại không hợp lệ")]
        [RegularExpression(@"[0-9\-\.\(\)\+]*", ErrorMessage = "Số điện thoại không hợp lệ")]
        [Display(Name = "Điện thoại 1:")]
        public string Phone1 { get; set; }

        [MinLength(7)]
        [RegularExpression(@"[0-9\-\.\(\)\+]*", ErrorMessage = "Số điện thoại không hợp lệ")]
        [Display(Name = "Điện thoại 2:")]
        public string Phone2 { get; set; }

        [MinLength(7)]
        [RegularExpression(@"[0-9\-\.\(\)\+]*", ErrorMessage = "Số điện thoại không hợp lệ")]
        [Display(Name = "Điện thoại 3:")]
        public string Phone3 { get; set; }

        [Display(Name = "Nhóm:")]
        public int? GroupID { get; set; }
        [Display(Name = "Địa Chỉ:")]
        [Required(ErrorMessage = "*")]
        public string Address { get; set; }

        [Display(Name = "Đối tác:")]
        public int PartnerId { get; set; }

        [Display(Name = "Loại thành viên:")]
        [Required(ErrorMessage = "*")]
        public int UserTypeId { get; set; }

        [Display(Name = "Họ tên:")]
        [Required(ErrorMessage = "*")]
        public string Fullname { get; set; }
        [Required(ErrorMessage = "*")]
        [RegularExpression(@"^([a-zA-Z0-9_\-\.]+)@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.)|(([a-zA-Z0-9\-]+\.)+))([a-zA-Z]{2,4}|[0-9]{1,3})(\]?)$", ErrorMessage = "Email không hợp lệ")]
        public string Email { get; set; }

        [Display(Name = "Nghề nghiệp:")]
        public string Occupation { get; set; }
        [Display(Name = "Thu nhập hàng năm:")]
        public string AnualIncome { get; set; }
        [Display(Name = "Lĩnh vực:")]
        public string Industry { get; set; }
        [RegularExpression(@"\d{4}$", ErrorMessage = "Năm không hợp lệ")]
        [Display(Name = "Năm sinh:")]
        public string BirthYear { get; set; }
        [Display(Name = "Mô tả thêm:")]
        public string Description { get; set; }
    }

    [UserConstraint("Email", "Username", ErrorMessage="Email hoặc tên đăng nhập đã đượcs được dụng")]
    public class UserCreateModel
    {
        [Required(ErrorMessage = "*")]
        [MinLength(4, ErrorMessage="Tên đăng nhập không được ít hơn 4 kí tự")]
        [Display(Name="Tên đăng nhập:")]
        public string Username { get; set; }

        [Display(Name = "Mật khẩu:")]
        [Required(ErrorMessage = "*")]
        [MinLength(4, ErrorMessage = "Mật khẩu không được ít hơn 6 kí tự")]
        public string Password { get; set; }

        [Display(Name = "Xác nhận mật khẩu:")]
        [Compare("Password", ErrorMessage="Password doesn't match")]
        [Required(ErrorMessage="*")]
        public string ConfirmPassword { get; set; }

        [Required(ErrorMessage = "*")]
        [MinLength(7, ErrorMessage = "Số điện thoại không hợp lệ")]
        [RegularExpression(@"[0-9\-\.\(\)\+]*", ErrorMessage="Số điện thoại không hợp lệ")]
        [Display(Name = "Điện thoại 1:")]
        public string Phone1 { get; set; }

        [MinLength(7)]
        [RegularExpression(@"[0-9\-\.\(\)\+]*", ErrorMessage = "Số điện thoại không hợp lệ")]
        [Display(Name = "Điện thoại 2:")]
        public string Phone2 { get; set; }

        [MinLength(7)]
        [RegularExpression(@"[0-9\-\.\(\)\+]*", ErrorMessage = "Số điện thoại không hợp lệ")]
         [Display(Name = "Điện thoại 3:")]
        public string Phone3 { get; set; }

        [Display(Name = "Nhóm:")]
        public int? GroupID { get; set; }
         [Display(Name = "Địa Chỉ:")]
         [Required(ErrorMessage = "*")]
        public string Address { get; set; }

        [Display(Name = "Đối tác:")]
        public int PartnerId { get; set; }

         [Display(Name = "Loại thành viên:")]
         [Required(ErrorMessage = "*")]
        public int UserTypeId { get; set; }

         [Display(Name = "Họ tên:")]
         [Required(ErrorMessage = "*")]
        public string Fullname { get; set; }
         [Required(ErrorMessage = "*")]
        [RegularExpression(@"^([a-zA-Z0-9_\-\.]+)@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.)|(([a-zA-Z0-9\-]+\.)+))([a-zA-Z]{2,4}|[0-9]{1,3})(\]?)$", ErrorMessage="Email không hợp lệ")]
        public string Email { get; set; }

         [Display(Name = "Nghề nghiệp:")]
        public string Occupation { get; set; }
         [Display(Name = "Thu nhập hàng năm:")]
        public string AnualIncome { get; set; }
         [Display(Name = "Lĩnh vực:")]
        public string Industry { get; set; }
        [RegularExpression(@"\d{4}$", ErrorMessage="Năm không hợp lệ")]
        [Display(Name = "Năm sinh:")]
        public string BirthYear { get; set; }
         [Display(Name = "Mô tả thêm:")]
        public string Description { get; set; }
    }
    public class MyAccountModel
    {
        public User UserInfo { get; set; }
        [Required(ErrorMessage = "*")]
        [MinLength(4, ErrorMessage = "Mật khẩu không được ít hơn 6 kí tự")]
        [Display(Name = "Mật khẩu mới:")]
        public string Password { get; set; }
        [Compare("Password", ErrorMessage = "Mật khẩu không khớp")]
        [MinLength(4, ErrorMessage = "Mật khẩu không được ít hơn 6 kí tự")]
        [Required(ErrorMessage = "*")]
        [Display(Name = "Xác nhận mật khẩu:")]
        public string ConfirmPassword { get; set; }
        [Required( ErrorMessage="*")]
        [Display(Name="Mật khẩu cũ:")]
        public string OldPassword { get; set; }
    }
}