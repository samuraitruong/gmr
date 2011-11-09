using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Net;
using System.IO;

namespace GMR.Common.Net

{
    public class WebRequest
    {
        public static string LoadHtml(string url)
        {
            HttpWebRequest request = HttpWebRequest.Create(url) as HttpWebRequest;
            var response = request.GetResponse();
            var stream = response.GetResponseStream();
            string html = "";
            using(StreamReader reader = new StreamReader(stream)){
                html = reader.ReadToEnd();
            }
            
            response.Close();
            stream.Close();
            return html;
        }
    }
}
