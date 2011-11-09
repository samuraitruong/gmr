using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace GMR.Common.Crawling
{
    public class GoldOrgCrawler : WebCrawler
    {
        public GoldOrgCrawler(): base("http://www.gold.org/"){}
        public string GetstrapTools()
        {
            return GetNodeById("strapTools");
        }
    }
}
