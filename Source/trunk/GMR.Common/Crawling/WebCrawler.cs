using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using GMR.Common.Net;
using HtmlAgilityPack;

namespace GMR.Common.Crawling
{//
    //http://blog.abodit.com/2010/03/a-simple-web-crawler-in-c-using-htmlagilitypack/
   public class WebCrawler
    {
        public string Url { get; set; }
        public string Html { get; set; }
       public HtmlDocument  Document { get; set; }

        public WebCrawler(string url)
        {
            HtmlAgilityPack.HtmlWeb web = new HtmlWeb();
            Document = web.Load(url);
            //Html = WebRequest.LoadHtml(url);
        }
        public string GetNodeById(string id)
        {
            HtmlNode mynode = Document.DocumentNode.SelectNodes(string.Format("//*[@id=\"{0}\"]", id)).First();
            return mynode.InnerHtml;
        }
    }
}
