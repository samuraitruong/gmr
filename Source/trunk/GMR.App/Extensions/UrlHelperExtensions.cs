using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using GMR.Repository;

namespace GMR.App.Extensions
{
    public static class UrlHelperExtensions
    {
        public static string Home(this UrlHelper helper)
        {
            return helper.Action("Index", "Home", new { area = "" });

        }
        public static string CategoryLink(this UrlHelper helper, Category category)
        {
            return helper.RouteUrl("Category-View-Route", new { category = category.StaticName, area="Content"});

        }
        public static string NewsLink(this UrlHelper helper, News news)
        {
            if(string.IsNullOrEmpty(news.UrlKey)){
            return helper.Action("ViewNewsById", "Content", new {id=news.NewsID, area="Content"});
            }
            return helper.RouteUrl("News-View-Route", new { category = news.Category.StaticName, area = "Content" , news=news.UrlKey});

        }
    }
}