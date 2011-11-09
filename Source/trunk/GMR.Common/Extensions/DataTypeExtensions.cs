using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace GMR.Common.Extensions
{
    public static class DataTypeExtensions
    {
        public static bool IsGMRAppType(this Type type)
        {
//            myName.GetType().Namespace == "System"
//myName.GetType().Namespace.StartsWith("System")
//myName.GetType().Module.ScopeName == "CommonLanguageRuntimeLibrary"

            return type.Namespace.StartsWith("GMR.App");
        }
    }
}
