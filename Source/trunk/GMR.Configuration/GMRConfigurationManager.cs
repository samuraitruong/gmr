using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Configuration;
using GMR.Configuration.Elements;

namespace GMR.Configuration
{
    public class GMRConfigurationManager
    {
        public static GMRConfigurationSection instance;

        public static GMRConfigurationSection GetInsance()
        {
            if (instance == null)
            {
                instance = (GMRConfigurationSection)ConfigurationManager.GetSection("GMR.Configuration");
            }
            return instance;
        }
        public static FileResponsityElement FileResponsity
        {
            get
            {
                return GetInsance().FileResponsityElement;
            }
        }
        public static LuceneElement LuceneElement
        {
            get
            {
                return GetInsance().LuceneElement;
            }
        }
        public static WebUIElement WebUI
        {
            get
            {
                return GetInsance().WebUIElement;
            }
        }
        public static EmailingElement   Emails
        {
            get
            {
                return GetInsance().EmailingElement;
            }
        }

    } 
}
