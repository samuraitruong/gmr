using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using System.Text;
using PagedList;
using GMR.App.Areas.Administration.Models;
using System.Web.Routing;
using System.Reflection;
using GMR.Repository;

namespace GMR.App.Extensions
{
	public static class HtmlHelperExtensions
	{
		public static string Logo(this HtmlHelper helper, string logo)
		{
			StringBuilder sb = new StringBuilder();
			UrlHelper urlHelper = new UrlHelper(helper.ViewContext.RequestContext);
			sb.AppendFormat(" <img width=\"60\" height=\"60\" src=\"{0}\" />", urlHelper.Action("Logo", "Image", new { Name = logo, Area = "" }));
			return sb.ToString();
		}

		public static string DisplayError(this HtmlHelper helper)
		{
			var keys = helper.ViewContext.ViewData.ModelState.Where(p => p.Key.StartsWith("Error"));
			List<ModelError> errors = new List<ModelError>();
			foreach (var key in keys)
			{
				errors.AddRange(helper.ViewContext.ViewData.ModelState[key.Key].Errors.ToList());
			}
			if (errors.Count == 0) return string.Empty;
			
			StringBuilder sb = new StringBuilder();
			sb.Append("<ul class=\"system_messages\">");
			foreach (var item in errors)
				{
			  sb.AppendFormat("<li class=\"red\"><span class=\"ico\"></span><strong class=\"system_title\">{0}</strong></li>", item.ErrorMessage);
			}
																	
																	
			sb.Append("</ul>");
			return sb.ToString();
		   // UrlHelper urlHelper = new UrlHelper(helper.ViewContext.RequestContext);
		   // sb.AppendFormat(" <img width=\"60\" height=\"60\" src=\"{0}\" />", urlHelper.Action("Logo", "Image", new { Name = logo, Area = "" }));
		   // return sb.ToString();
		}


		public static string Image(this HtmlHelper helper, string img)
		{
			StringBuilder sb = new StringBuilder();
			UrlHelper urlHelper = new UrlHelper(helper.ViewContext.RequestContext);
			sb.AppendFormat(" <img width=\"60\" height=\"60\" src=\"{0}\" />", urlHelper.Action("View", "Image", new { Name = img, Area = "" }));
			return sb.ToString();
		}
		public static string Truncate(this HtmlHelper helper, string input, int length)
		{
			if (input.Length <= length)
			{
				return input;
			}
			else
			{
				return input.Substring(0, length) + "...";
			}
		}
		public static string FormatCurrency(this HtmlHelper helper, decimal value)
		{
			//System.Globalization.NumberFormatInfo nfi;
			//nfi = new NumberFormatInfo();
			//nfi.CurrencySymbol = "£";
			//sString = string.Format(nfi, "{0:C}", 123345);

			return string.Format("{0:C}", value);
		}
		public static string FormatCurrency(this HtmlHelper helper, decimal? value)
		{
			if (value.HasValue) return value.Value.ToString("#,##0.00", new System.Globalization.CultureInfo("en-US"));
			return "0";
			//value.Value.ToString("#,##0", new System.Globalization.CultureInfo("en-US"));

			return string.Format("#,##0", value.HasValue ? value.Value : 0);
			//return string.Format("{0:C}", value.HasValue ? value.Value : 0);
		}
		public static string GeneratePager(this HtmlHelper helper, IPagedList<object> data, string controller, string action, string pageParameter, object additionalData)
		{
			Type type = additionalData.GetType();
			var properties = type.GetProperties();
			List<KeyValuePair<string, object>> parameters = new List<KeyValuePair<string, object>>();
			foreach (var item in properties)
			{
				var obj = item.GetValue(additionalData, null);
				if (obj == null) continue;
				parameters.Add( new KeyValuePair<string,object>( item.Name, obj));
					
			}
			if (parameters.Count > 0)
			{
				return helper.GeneratePager(data, controller, action, pageParameter, parameters.ToArray());
			}
			return helper.GeneratePager(data, controller, action, pageParameter);
		}
		public static string GeneratePager(this HtmlHelper helper, IPagedList<object> data, string controller, string action, string pageParameter,params KeyValuePair<string, object>[] Parameters )
		{
			string url = "";
			foreach (var item in Parameters)
			{
				if(item.Value!= null)
				url += string.Format("&{0}={1}", item.Key, item.Value.ToString());
			}
			return helper.GeneratePager(data, controller, action, pageParameter, url, true);
		}
		public static string GeneratePager(this HtmlHelper helper, IPagedList<object> data, string controller, string action, string pageParameter)
		{
			return helper.GeneratePager(data, controller, action, pageParameter, string.Empty, true);
		}
		public static string GeneratePager(this HtmlHelper helper, IPagedList<object> data,string controller, string action, string pageParameter, string url, bool b)
		{
            if (data.PageCount <= 1) return string.Empty;

			int displayedItem = Math.Min(10, data.Count);

			int begin = data.PageNumber;
			int end = data.PageNumber;

			while (displayedItem>0 && end< data.PageCount)
			{
				if (begin > 1 ) {
					begin--;
						displayedItem--;
				}
				if (end < data.PageCount)
				{
					end++;
					displayedItem--;
				}
			}
			//int begin = Math.Max(1, data.PageNumber - displayedItem / 2);
			//int end = Math.Min(data.PageNumber + displayedItem/2 - begin, data.PageCount);
			//begin = Math.Min(begin, data.PageCount - displayedItem);

			UrlHelper urlHelper = new UrlHelper(helper.ViewContext.RequestContext);
			StringBuilder sb = new StringBuilder();
			sb.AppendFormat("<div class=\"pagination\">");
            
			if (data.PageCount > 1)
			{
                sb.AppendFormat("<span class=\"page_no\">Total : {0} -  Page {1} of {2}</span>", data.TotalItemCount, data.PageNumber, data.PageCount);

				sb.AppendFormat("<ul class=\"pag_list\">");
				if (data.HasPreviousPage)
				{
					sb.AppendFormat("<li><a href=\"{0}\" class=\"button light_blue_btn\"><span><span>PREVIOUS</span></span></a>", GetPaggeUrl(urlHelper, controller, action, pageParameter, data.PageNumber - 1, url));
					sb.AppendFormat("</li>");
				}
				if (begin > 1)
				{
					sb.AppendFormat("<li><a href=\"{0}\">{1}</a></li>", GetPaggeUrl(urlHelper, controller, action, pageParameter, 1, url), 1);
					sb.AppendFormat("<li>[...]</li>");
				}
				for (int i = begin; i <= end; i++)
				{
					if (i == data.PageNumber)
					{
						sb.AppendFormat("<li><a href=\"{1}\" class=\"current_page\"><span><span>{0}</span></span></a></li>", i,GetPaggeUrl(urlHelper, controller, action, pageParameter, i, url));
					}
					else
					{
						sb.AppendFormat("<li><a href=\"{0}\">{1}</a></li>", GetPaggeUrl(urlHelper, controller, action, pageParameter, i, url),i);
					}
				}
				if (end < data.PageCount)
				{
					sb.AppendFormat("<li>[...]</li>");
					sb.AppendFormat("<li><a href=\"{0}\">{1}</a></li>", GetPaggeUrl(urlHelper, controller, action, pageParameter, data.PageCount, url), data.PageCount);
				}
				//    sb.AppendFormat("<li><a href=\"#\">1</a></li>");
				//sb.AppendFormat("<li><a href=\"#\" class=\"current_page\"><span><span>2</span></span></a></li>");
				//sb.AppendFormat("<li><a href=\"#\">3</a></li>");
				//sb.AppendFormat("<li><a href=\"#\">4</a></li>");
				//sb.AppendFormat("<li><a href=\"#\">5</a></li>");
				//sb.AppendFormat("<li>[...]</li>");
				//sb.AppendFormat("<li><a href=\"#\">217</a></li>");
				if (data.HasNextPage)
				{
					sb.AppendFormat("<li><a href=\"{0}\" class=\"button light_blue_btn\"><span><span>NEXT</span></span></a>", GetPaggeUrl(urlHelper, controller, action, pageParameter, data.PageNumber + 1, url));
					sb.AppendFormat("</li>");
				}
				sb.AppendFormat("</ul>");
			}
			sb.AppendFormat("</div>");
			return sb.ToString();
		}

		private static string GetPaggeUrl(UrlHelper urlHelper, string controller, string action, string parameter, int page, string addUrl)
		{
			Dictionary<string, object> dictionary = new Dictionary<string, object>();
			dictionary.Add(parameter, page);
			RouteValueDictionary routes = new RouteValueDictionary(dictionary);
			string url = urlHelper.Action(action, controller, routes);
			return url+addUrl;
		}
        public static string PageBreadcrum(this HtmlHelper helper, News item)
        {
            UrlHelper url = new UrlHelper(helper.ViewContext.RequestContext);
            StringBuilder sb = new StringBuilder();
            Category category = item.Category;
            List<Category> categories = new List<Category>();
           
            categories.Add(category);
            while (category.Category1!= null)
	        {
                category = category.Category1;
                categories.Insert(0, category);
	        };
            sb.AppendFormat("<h3>");
            sb.AppendFormat("<a href=\"{0}\">Trang chủ</a>",url.Home());
            sb.AppendFormat("<span class=\"space\"><img src=\"/Content/images/next.gif\"></span>");

            foreach (var cat in categories)
            {
               sb.AppendFormat(" <a href=\"{0}\">{1}</a><span class=\"space\"><img src=\"/Content/images/next.gif\"></span>",url.CategoryLink(cat), cat.CategoryName);
            }

            sb.AppendFormat("<span class=\"current\">{0}</span>", item.Subject);

            sb.AppendFormat("</h3>");
            return sb.ToString();
        }
    }
}