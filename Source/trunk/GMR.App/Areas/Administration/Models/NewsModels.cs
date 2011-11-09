using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using GMR.Repository ;
using PagedList;
using System.ComponentModel.DataAnnotations;
using GMR.Repository;
namespace GMR.App.Areas.Administration.Models
{
    public  class ViewNewsModel
	{
		
	
    public News NewsItem { get; set; }
}
    public class NewsIndexModel
    {
        public PagedList<News> NewsItems { get; set; }
    }
    public class EditNewsModel : CreateNewsModel
    {
        public int NewsID { get; set; }
    }
    public class CreateNewsModel
    {
        public string ImagePath { get; set; }
        [Required (ErrorMessage="*")]
        [Display(Name = "Tiêu đề:")]
        public string Subject { get; set; }

        [Required(ErrorMessage = "*")]
        [Display(Name = "Tóm tắt:")]
        public string Headline { get; set; }

        [Required(ErrorMessage = "*")]
        [Display(Name="Danh mục:")]
        public int CategoryId { get; set; }

          [Display(Name = "Nội dung:")]
        public string Content { get; set; }
          [Display(Name = "Mô tả thêm:")]
        public string Description { get; set; }

          [Display(Name = "Nguồn:")]
        public string Source { get; set; }
          [Display(Name = "Tác giả:")]
        public string Author { get; set; }
          [Display(Name = "Hình:")]
        public string Image { get; set; }

          [Display(Name = "Tin nhắn SMS:")]
          public string SMSChannel { get; set; }
    }
}