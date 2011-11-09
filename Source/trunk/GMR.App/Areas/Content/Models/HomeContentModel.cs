using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using PagedList;
using GMR.Repository;

namespace GMR.App.Areas.Content.Models
{
    public class HomeContentModel
    {
        public MarketPrice MyProperty { get; set; }
    }
    public class ViewCategoryModel
    {
        public Category Category { get; set; }
        public List<Category> SubCategories { get; set; }
        public List<News> LastestNews { get; set; }

        public PagedList<News> LastedNewsPaged { get; set; }
    }
    public class ContentViewNewsModel
    {
        public Category Category { get; set; }
        public News NewsItem { get; set; }
        public List<Category> SubCategories { get; set; }

        public List<News> RelatedNews { get; set; }
    }
    public class SMSAccessModel
    {
        public string Source { get; set; }

    }
}