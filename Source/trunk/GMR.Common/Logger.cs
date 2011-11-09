using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using NLog;

namespace GMR.Common
{
    public class Logger
    {
        private static NLog.Logger logger = LogManager.GetCurrentClassLogger();
        public static void Log(string message)
        {
            logger.Log(LogLevel.Info, message);
        }
        public static void Log(Exception ex)
        {
            logger.Log(LogLevel.Error, ex.Message+ ex.InnerException+ex.StackTrace);
        }
    }
}
