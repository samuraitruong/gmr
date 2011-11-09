using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.IO;
using System.Web;

namespace GMR.Biz.Models
{
    public class GMRSetting
    {
        public enum SettingKeys
        {
            ImagePath,
            PageSize,
            LogoPath,
            NoLogo,
            LastestNewsDisplayed,
            LastestNewsDisplayedOnHP,
            MarketInfoCategoryId,
            MarketInfoDisplayedItem,
            RelatedNewsItemDisplayed,
            MaqueeNewsItem
        }
        private static string GetFullPath(string relativePath)
        {
            if (Path.IsPathRooted(relativePath)) return relativePath;
            return HttpContext.Current.Server.MapPath(relativePath);
        }
        public static string ImagePath{
            get {
                
                var item = new SettingService().GetSetting(SettingKeys.ImagePath);
                if (item != null )
                {
                    return GetFullPath(item.Value);
                }
                return string.Empty;
            }
        }
        public static int PageSize
        {
            get
            {

                var item = new SettingService().GetSetting(SettingKeys.PageSize);
                return GetInt(item, 50);
            }
        }

        public static int RelatedNewsItemDisplayed
        {
            get
            {

                var item = new SettingService().GetSetting(SettingKeys.RelatedNewsItemDisplayed);
                return GetInt(item, 10);
            }
        }
        public static int MarketInfoCategoryId
        {
            get
            {

                var item = new SettingService().GetSetting(SettingKeys.MarketInfoCategoryId);
                return GetInt(item, 1);
            }
        }
        public static int MarketInfoDisplayedItem
        {
            get
            {
                var item = new SettingService().GetSetting(SettingKeys.MarketInfoDisplayedItem);
                return GetInt(item, 10);
            }
        }

        private static int GetInt(Repository.Setting item, int defaultvalue)
        {
            if (item != null && item.Value != Constrants.DEFAULT)
            {
                int result = 0;
                if (int.TryParse(item.Value, out result)) return result;
            }
            return defaultvalue; //Default value
        }

        public static int LastestNewsDisplayed
        {
            get
            {

                var item = new SettingService().GetSetting(SettingKeys.LastestNewsDisplayed);
                return GetInt(item, 2);
            }
        }

        public static int LastestNewsDisplayedOnHP
        {
            get
            {

                var item = new SettingService().GetSetting(SettingKeys.LastestNewsDisplayedOnHP);
                return GetInt(item, 4);
            }
        }
        public static string NoLogo
        {
            get
            {

                var item = new SettingService().GetSetting(SettingKeys.NoLogo);
                if (item != null)
                {
                    return GetFullPath(item.Value);
                }
                return string.Empty;
            }
        }
        public static string LogoPath
        {
            get
            {
                
                var item = new SettingService().GetSetting(SettingKeys.LogoPath);
                if (item != null)
                {
                    return GetFullPath(item.Value);
                }
                return string.Empty;
            }
        }

        public static int MaqueeNewsItem {
            get
            {
                var item = new SettingService().GetSetting(SettingKeys.MaqueeNewsItem);
                return GetInt(item, 10);
            }
        }
    }
}
