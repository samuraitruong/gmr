using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Configuration;
using GMR.Configuration.Elements;

namespace GMR.Configuration
{
    public class GMRConfigurationSection : ConfigurationSection
    {

        [ConfigurationProperty("FileResponsity")]
        public FileResponsityElement FileResponsityElement
        {
            get { return (FileResponsityElement)this["FileResponsity"]; }

        }
        [ConfigurationProperty("lucene")]
        public LuceneElement LuceneElement
        {
            get { return (LuceneElement)this["lucene"]; }

        }
        [ConfigurationProperty("WebUIElement")]
        public WebUIElement WebUIElement
        {
            get { return (WebUIElement)this["WebUIElement"]; }
        }
        [ConfigurationProperty("emailing")]
        public EmailingElement EmailingElement
        {
            get { return (EmailingElement)this["emailing"]; }
        }
    }
}
