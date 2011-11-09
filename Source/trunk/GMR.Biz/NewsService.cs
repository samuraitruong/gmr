using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using GMR.Repository;
using GMR.Common;
using GMR.Biz.Helpers;
using GMR.Biz.Models;
using GMR.Biz.Extensions;
using GMR.Common.Extensions;
using GMR.Common.EF;
namespace GMR.Biz
{
    public class NewsService : GMRService<News>
    {

        public  void AddNews(News news, System.Web.HttpPostedFileBase Image)
        {
            //Add Business logic to save image

            if (Image != null && Image.ContentLength > 0)
            {
                string filename = FileUploader.UploadImage(GMRSetting.ImagePath, Image.InputStream, Image.FileName);
                news.ImagePath = filename;
            }
            news.UrlKey = news.GetUrlKey();

            news.CreatedDate = news.UpdateDate = DateTime.Now;
            news.StategyType = "NA";
            news.Status = EntityStates.Activated.ToString();
            Add(news);
        }

        public void Edit(News newsItem, System.Web.HttpPostedFileBase image)
        {
            newsItem.UpdateDate = DateTime.Now;

            if (image != null && image.ContentLength > 0)
            {
                if (string.IsNullOrEmpty(newsItem.ImagePath))
                {
                    string filename = FileUploader.UploadImage(GMRSetting.ImagePath, image.InputStream, image.FileName, false);

                    newsItem.ImagePath = filename;
                }
                else
                {
                    FileUploader.UploadImage(GMRSetting.LogoPath, image.InputStream, newsItem.ImagePath, true);
                }

            }
            var item = FirstOrDefault(p => p.NewsID == newsItem.NewsID);
            item.CopyPropertiesFrom(newsItem, "Status", "CreatedUserID");
            item.UrlKey = item.Subject.ToUrlKey();

            //item.Status = EntityStates.Activated.ToString();

            UnitOfWork.Commit();
        }

        public News GetNewsByKey(string news)
        {
            return GetQuery().FirstOrDefault(p => p.UrlKey == news);
        }

        public List<News> GetLastestSMSAccessNews()
        {
            string smstype = AccessTypes.SMS.ToString();
            string status = EntityStates.Activated.ToString();
            var paged = GetPaged(p => p.Category.AccessTypes == smstype && p.Status == status,
                new IOrderByClause<News>[] { new OrderByClause<News, DateTime>(a => a.UpdateDate.Value, SortDirection.Decending) },
                1,

                GMRSetting.LastestNewsDisplayedOnHP
                );

           return paged.ToList();
        }

        public List<News> GetLastestMarketInfoNews(out Category category)
        {
            category = null;

            var query = GetQuery();
            //query.OrderByDescending(p => p.UpdateDate).Distinct(new NewsComparer());

            var x = from p in query
                    orderby p.UpdateDate descending
                    group p by new { p.News_CategoryID }
                        into mygroup
                        where mygroup.Count() > 0

                        select mygroup.OrderByDescending(c => c.UpdateDate).Take(2);

            List<News> results = new List<News>();
            foreach (var item in x)
            {
                results.AddRange(item.ToList());

            }
            return results;
            //var result = x.OrderByDescending(p => p).ToPagedList(1, 100);
            //return (PagedList<MarketPrice>)result;

            //category = null;
            //int id = GMRSetting.MarketInfoCategoryId;
            //string status = EntityStates.Activated.ToString();
            //var result = GetPaged(p => p.Status == status,
            //    new IOrderByClause<News>[] { new OrderByClause<News, DateTime>(p => p.UpdateDate.Value, SortDirection.Decending) },
            //    1,
            //    GMRSetting.MarketInfoDisplayedItem
            //    );
            //if(result!= null && result.Count>0)
            //category = result[0].Category;
            //return result;
        }

        public List<News> GetRelatedNews(int newsId)
        {
            var item =FirstOrDefault(p=>p.NewsID ==newsId);
            var paged = GetPaged(p=>p.NewsID != newsId && p.News_CategoryID == item.News_CategoryID,
                new IOrderByClause<News>[] {new OrderByClause<News, DateTime>(p=>p.UpdateDate.Value, SortDirection.Decending)},
                1,
                GMRSetting.RelatedNewsItemDisplayed);
            return paged.ToList();
        }

        public void DeleteNews(int id)
        {
            News item = GetById(id);
            item.Status = EntityStates.Deleted.ToString();
            item.UpdateDate = DateTime.Now;
            UnitOfWork.Commit();
        }

        public News GetById(int id)
        {
            return FirstOrDefault(p => p.NewsID == id);
        }

        public List<News> GetLastestMaqueeNews()
        {
            string status = EntityStates.Activated.ToString();
            string accesstype = AccessTypes.SMS.ToString();
            var paged = GetPaged(p => p.Category.AccessTypes != accesstype && p.Status == status
                , new IOrderByClause<News>[] { new OrderByClause<News, DateTime>(p => p.UpdateDate.Value, SortDirection.Decending) },
                1,
                GMRSetting.MaqueeNewsItem);
            return paged.ToList();   
        }
    }
}
